Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6660DC83F26
	for <intel-xe@archiver.kernel.org>; Tue, 29 Jul 2025 03:52:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2859C10E5BB;
	Tue, 29 Jul 2025 03:52:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JBuMqnOI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9F5310E1B1
 for <intel-xe@lists.freedesktop.org>; Tue, 29 Jul 2025 03:52:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753761153; x=1785297153;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=/WqHrpCFbNRTmPW2nTL5wXw/Yb0oIDnhIGbyXD2ViBM=;
 b=JBuMqnOIDi+cU66xYMatx+6+htTcjODF588fmp2pLxYGooCB0GTivEPf
 qXURXSjzkS0++lCI9hNJGsJtkz/SU6adx9ZU9h6+VidhkLDkgdvePDPo0
 eoJ5yPz9c1kfU7ACD7Z8KaN/b+rlBip8DG5IUnhOdAgFS7dOUdEXS9Chb
 zPTPmWraYDLkrXXhPzvBHTW9DDQXQqMFt7pGs2jrsc1lnV2RUObbuM5Fn
 4oiORYbxDHZnj3zjr8nvnXEWnx/qkhAgrzKKp6eUABTV4PJCECbcsEDWL
 m16zEk/IV0oicPbwws3PS+39Idr5uYkB2rm3I/3hcZp3DFpqRmUFTWcLC A==;
X-CSE-ConnectionGUID: FcUVZrwYQDOPXR/4+dawLw==
X-CSE-MsgGUID: ljMcPOFnRLqQa50+dSChJw==
X-IronPort-AV: E=McAfee;i="6800,10657,11505"; a="56169637"
X-IronPort-AV: E=Sophos;i="6.16,348,1744095600"; d="scan'208";a="56169637"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2025 20:52:32 -0700
X-CSE-ConnectionGUID: XPn5QgDCRiazbOuGEyS8xA==
X-CSE-MsgGUID: Imtx3KJ/Rciz/C8EPYBBZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,348,1744095600"; d="scan'208";a="161857827"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2025 20:52:33 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 28 Jul 2025 20:52:31 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Mon, 28 Jul 2025 20:52:31 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (40.107.100.55)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 28 Jul 2025 20:52:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NlcmhKbtn1igGhdKAnFi4C85oz1ti/x78qRx0g86fUJKSh0fi0RqQCZiYjbokYiPru2MZy8QvjQOlJkYXGnaS+L7k3YGf4V5ckpCwfaPi4QO+E6YwUhdLiUoFRGRL9y0UBTLncEN2JCCRspjtf5CbgJKJNoBS+JVz4ox6CzK6QFew3w01O8Vo5FbXb4elSJpdELcaTwszQiTuSB1fnylcBkBdnQMUPlJRkAMQTOnj4XeLJodyeWW+rVvhJ5ZUxmgtf4AYbYwEr/cBoUKz1B3BsOXFiPL051r7XKlASQe04WltoqTpcJOmLhDszZcfp5qvVXYKV+s2o8UhrR6zeyFeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TqQZnmMGvKD8KeAMt3g4daLi+yAqME1zyRU+TW++OsQ=;
 b=o2nVn53u3mfFKInosc2UsyDBWwIm8A55v7RBI2d5CdHKhhUcZLh+N1mAqyhISrlQk2leku1ELLiFCjacMI7JFVIRc7HVGfa6aVXbfqXekots8oFH459ErCcTy0EhsDdtrONLgUFtHuF0O97QHUspVh6bRQW7uiWKdPFeyL8K524NAnLzySweOfkKfUfQED4Yt+fv8TyXK0Fk3LmvvFrP0xIAhN7a5fXAArlRvnfVprdN7DKjFAyWD1o0T16iekBF91BmlmwYWtkku9NzxbPbg/vW3i8CW/lkvPfEluTguYn/k03zsZJV//Qq8CmHThg+UN8hDd4Bp4De7zTvQsEfBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH0PR11MB4886.namprd11.prod.outlook.com (2603:10b6:510:33::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.11; Tue, 29 Jul
 2025 03:52:29 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.8964.026; Tue, 29 Jul 2025
 03:52:29 +0000
Date: Mon, 28 Jul 2025 20:52:26 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Thomas =?iso-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>, Shuicheng Lin <shuicheng.lin@intel.com>
Subject: Re: [PATCH v5 10/23] drm/xe: Implement madvise ioctl for xe
Message-ID: <aIhFeh5rSjtg3W3K@lstrano-desk.jf.intel.com>
References: <20250722133526.3550547-1-himal.prasad.ghimiray@intel.com>
 <20250722133526.3550547-11-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250722133526.3550547-11-himal.prasad.ghimiray@intel.com>
X-ClientProxiedBy: MW4PR03CA0155.namprd03.prod.outlook.com
 (2603:10b6:303:8d::10) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH0PR11MB4886:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c0b3f80-de68-471b-e952-08ddce5356e0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?PXpQ1EAHuR4j9kQcpaS7XQbv3NVz/5L75eJEtHJuBEefDnYR5WcukxNDB2?=
 =?iso-8859-1?Q?mSWJz37wSA2Am4UOHm6a4mPjSkzp9QXE9St6O8TUZBLQ9d59ctgzxahkqN?=
 =?iso-8859-1?Q?fSFtvfiijXYAXj498F1/0zlaZnQpj9NJHPkb+X2Xd5h8/w9BA/bsRWjNSG?=
 =?iso-8859-1?Q?AWbTjqIofGjnNJCp5BIgUaF1xaCDROz6Qf+vIWiT9SvEDCguhpLg7bLHZ6?=
 =?iso-8859-1?Q?iaMNSElQm3uk5OmS/tnUHpD6mxCypk6/hm3u5R27LFTan31x+qOuDPTbvw?=
 =?iso-8859-1?Q?qy2FN7g+p3xtI/xwIe+CD8HbeqnslkEWxHVMp24zHgg0K5x5nqJNoDzP8I?=
 =?iso-8859-1?Q?I+T4BJjsQGQmRSQ1OHSONPg/Si/9j/oZnd6+abWw4iOdzFbA+ZerfZtcPj?=
 =?iso-8859-1?Q?CUnyk3fBVnfqyPJc+rI4y12toxpMVdR3HnISL/acuAKsX0cJ+jxYcYpC1T?=
 =?iso-8859-1?Q?m26diV5btFP6NywyyVXZYLsGPhG7QBMbcp0+Q5W43GuDk0GufydyZfmzH8?=
 =?iso-8859-1?Q?JEpFPvohe19cGCzm4Yz1x3JfRCmYrlSdxL0MGTHstIsQE1okiioQQP9V2d?=
 =?iso-8859-1?Q?qGs+vAM8NCFFDtuEVaVohCWOEiSj5+VrHazt8YBn4sZHhi5b9CgFEzpYUC?=
 =?iso-8859-1?Q?TdLUupBHGwVD8Y49b4kfOA8ladNeu2SCDh0ijs/MhE7sAx9pj6lpn1RW1h?=
 =?iso-8859-1?Q?c5/R/LbJaQoz+sWuFM6Eu/HKDVWZh2MIgWa444ZiOAiKa7KFtBbDVIR1fg?=
 =?iso-8859-1?Q?A15DusKvgl4y33LKaXwPCZFvwclaZNXvWbIjy4A74odgxlBiX+s5pG3xfm?=
 =?iso-8859-1?Q?xjbIHsTkiDU0FLMhOPDO1+4dbzxfDUg1WeEi+6PRjKY6waY2AhlkEc96Cu?=
 =?iso-8859-1?Q?MQ8leSk3uQOaaav86QF1nCI+d4OOY4KDMvgyOVO9oBxTatKD4oHcrGKVfd?=
 =?iso-8859-1?Q?AB70mQbzS1J4ceAcjNUcGMaeUXRp44UqXFECQLe+cUtJ1MYxq65AUfyrtV?=
 =?iso-8859-1?Q?EqLYbfGypGG1mrIQqWjOvgR2s6pbVygIGUXD5JT50z3euuRDRz/Ow6iSXD?=
 =?iso-8859-1?Q?Z8ImX8rUw8ry+86PCtXzdWiIyvH9ByTZq+MICWWW57PSIVT1daI6zRuXNl?=
 =?iso-8859-1?Q?IWJUhOQSdG+8xp/gJ8PybufSf6zOLHzBZ2s5FwXwFOGD3qloNcNlGNDRV9?=
 =?iso-8859-1?Q?VAGT14ABBFURm0pU45T1ZuNXnV3cfjOR1kyzloAIsEOchAGAfyH0DfEqzE?=
 =?iso-8859-1?Q?rbDQHTHvvRdTZ1NtTukU2budljJCr9cE87cvBDrYkDp+6Qs/9vdXgw7L2J?=
 =?iso-8859-1?Q?S7Gyisa8KvpBYbQOTbaH1Nowny1VlakTBvRJwto+Lsn17iy3Pkr+Nm2Ya8?=
 =?iso-8859-1?Q?pIUFN8ttLHvCj2EJq0szdD22aRZ+jsJU1HS0G+moQDUq0bZu6h8thAKkt3?=
 =?iso-8859-1?Q?aYBRRrph5aAQhfwEzHZ3bokZFymaDRx05vv+Y4V7ygGD+hS6DZCqUWH0GZ?=
 =?iso-8859-1?Q?U=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?OJgjfv2xyZfucQ+uhz2u2AHzx6+rml3Zwko/Hq35Vb7ViXepqV+f0r5jLy?=
 =?iso-8859-1?Q?4rJjCLai+ItjVKndACc4iAdOzl1rFDTC2KpIB5/un+oVga2dnTs2jJ6b6i?=
 =?iso-8859-1?Q?tW+bPEgE14jNVr2KQe0egnRDEn36A8zEVquo0wFbBasbLwRDLv8b+7Xdr+?=
 =?iso-8859-1?Q?etL3eS1S8Y6ckw4O91wR+DOaQzvmGN5brAYiMyXUoFBTM1yaXJE0SL2NQ3?=
 =?iso-8859-1?Q?XQyBE4G3GP05aTEdQAExJIWPFAdFWF356+65BqKDCkeWmNf9ea731XMVRv?=
 =?iso-8859-1?Q?1umgorx1bO/Lo6tTMv+DeTppB5ODA2Dw5t0qAsGOT+V+pEqQW5y02KU+QH?=
 =?iso-8859-1?Q?LCRlfTJmvNWhHOTdGXnRxJmD1Kxi80QoPS3lUpg64jTkIG29pLYMgzhgWt?=
 =?iso-8859-1?Q?QXBdINzR4WysBgHWjosbRIkBJE40GkW/58HeBo/pk9yZ4tBwt+9+MEQWJ2?=
 =?iso-8859-1?Q?CuD61FHF2RfN/aix/OgypY5NuN+9fbuGOLrXlYL5AelnTFw83zLpwUxJ7w?=
 =?iso-8859-1?Q?Ka4SzM8V+x+2jeexNKTocaBqnayOA54R08v7SDLYySdaSBWY/BBvBj8hSJ?=
 =?iso-8859-1?Q?lp5a7WZq8RFruqAFKTueq4Etrx5bJkERJvS8lMwBLUl6lV9y6vd2fMt/4o?=
 =?iso-8859-1?Q?d9zk5tV5Q8J2f0fiAMIGUtLNtUCB32U258WGN0jncy7AeuOUyOicvDoASS?=
 =?iso-8859-1?Q?yjuu6YR5VIhIep6f9z6nIXQnhO5ND23TyqWnHRTLOytS1to70vXsyUwtKI?=
 =?iso-8859-1?Q?rrKLiMmS6HsXbS43Xxn/dsXyYDYPMfQ7ObtVDWs1i9wVKN5v58ZgfNCFXb?=
 =?iso-8859-1?Q?uP86aNNcel/toksfsu0esb8MDXCclMeH7x5Iut3SK1KBpXHJBqvFuXaLU/?=
 =?iso-8859-1?Q?I+azHujJOSg22ZgSp9RqrhLP1mSym7n2xQd8ZRc7XCbKC6mZhBnlo9g2If?=
 =?iso-8859-1?Q?f15l5jihLlkiEnZjXXb/qdEQUjNKlwsAuDOdAa3MtpeIOEFb22hblWvOOw?=
 =?iso-8859-1?Q?QdOzzsL/glkaVvOU1pxwNk0rNQmS5IYZ01zC/bmSevNxR0hLNjp8TYEc3S?=
 =?iso-8859-1?Q?RowqfctISFsHfzzestkFk11/PbJ+UdFrbe+XZ3s71Vvoy+AzNIw3EPT4Vb?=
 =?iso-8859-1?Q?oICxxhsc3kvoLZ+Q/i7h8uPIVCwiRDSjaLhVqjZlLw3iQlESHq+abnfGJA?=
 =?iso-8859-1?Q?ibnCk0lJaDksATZCHjzi/qsaqIliirKIPRCSPsF8rx6485JTZ61w7S++Zo?=
 =?iso-8859-1?Q?kbJ2M4Cj2W8JD1QSwjVkuI43Fyw2142/ilTINw/1VFSBsFbwOi7aQHiKZ8?=
 =?iso-8859-1?Q?ZTj3DkIQOIGF9DJXGElx0coeIiPZ/L1RW0E9IIyz+NfodXsNtarNf98cWv?=
 =?iso-8859-1?Q?pFWM8fL+tl6ZoooKlnCdRUi/saVSOcHmIjuNBYJYvRzdbzL84jUsDkydn8?=
 =?iso-8859-1?Q?fDRWxQOeGwfUbU33i/tU9zCo29DJlyvZlicXSZgZTPTzWP5mIZjttK2508?=
 =?iso-8859-1?Q?11C7t4jz+QuX7I9nFl7i/WInZjhGSQvDw69zXLVOGFGfxO7JWfspLhQbRw?=
 =?iso-8859-1?Q?Z+52sYFuCNAW6mFZExae9gzUl92genm1nIcYeEOXkHwAaU4m6CRwe9Qz38?=
 =?iso-8859-1?Q?d0X4/v/72i3aAWlKGA0uxuVcHggcfqi+A6pmRx5DIBCndVerq214tRKQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c0b3f80-de68-471b-e952-08ddce5356e0
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2025 03:52:29.3166 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dX2sCYfgT+TYshZr5QjMDplNGswchDf5cp4u86n3+CJlXOnbHUseCsLhThtaXBeVYvtBknCvJLrpu81rYg8Iwg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4886
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

On Tue, Jul 22, 2025 at 07:05:13PM +0530, Himal Prasad Ghimiray wrote:
> This driver-specific ioctl enables UMDs to control the memory attributes
> for GPU VMAs within a specified input range. If the start or end
> addresses fall within an existing VMA, the VMA is split accordingly. The
> attributes of the VMA are modified as provided by the users. The old
> mappings of the VMAs are invalidated, and TLB invalidation is performed
> if necessary.
> 
> v2(Matthew brost)
> - xe_vm_in_fault_mode can't be enabled by Mesa, hence allow ioctl in non
> fault mode too
> - fix tlb invalidation skip for same ranges in multiple op
> - use helper for tlb invalidation
> - use xe_svm_notifier_lock/unlock helper
> - s/lockdep_assert_held/lockdep_assert_held_write
> - Add kernel-doc
> 
> v3(Matthew Brost)
> - make vfunc fail safe
> - Add sanitizing input args before vfunc
> 
> v4(Matthew Brost/Shuicheng)
> - Make locks interruptable
> - Error handling fixes
> - vm_put fixes
> 
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Shuicheng Lin <shuicheng.lin@intel.com>
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> ---
>  drivers/gpu/drm/xe/Makefile        |   1 +
>  drivers/gpu/drm/xe/xe_vm_madvise.c | 306 +++++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_vm_madvise.h |  15 ++
>  3 files changed, 322 insertions(+)
>  create mode 100644 drivers/gpu/drm/xe/xe_vm_madvise.c
>  create mode 100644 drivers/gpu/drm/xe/xe_vm_madvise.h
> 
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index 83a36c47a2f9..fa52866bb72c 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -125,6 +125,7 @@ xe-y += xe_bb.o \
>  	xe_uc.o \
>  	xe_uc_fw.o \
>  	xe_vm.o \
> +	xe_vm_madvise.o \
>  	xe_vram.o \
>  	xe_vram_freq.o \
>  	xe_vsec.o \
> diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.c b/drivers/gpu/drm/xe/xe_vm_madvise.c
> new file mode 100644
> index 000000000000..f64728120d7c
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_vm_madvise.c
> @@ -0,0 +1,306 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +
> +#include "xe_vm_madvise.h"
> +
> +#include <linux/nospec.h>
> +#include <drm/xe_drm.h>
> +
> +#include "xe_bo.h"
> +#include "xe_pt.h"
> +#include "xe_svm.h"
> +
> +struct xe_vmas_in_madvise_range {
> +	u64 addr;
> +	u64 range;
> +	struct xe_vma **vmas;
> +	int num_vmas;
> +	bool has_svm_vmas;
> +	bool has_bo_vmas;
> +	bool has_userptr_vmas;
> +};
> +
> +static int get_vmas(struct xe_vm *vm, struct xe_vmas_in_madvise_range *madvise_range)
> +{
> +	u64 addr = madvise_range->addr;
> +	u64 range = madvise_range->range;
> +
> +	struct xe_vma  **__vmas;
> +	struct drm_gpuva *gpuva;
> +	int max_vmas = 8;
> +
> +	lockdep_assert_held(&vm->lock);
> +
> +	madvise_range->num_vmas = 0;
> +	madvise_range->vmas = kmalloc_array(max_vmas, sizeof(*madvise_range->vmas), GFP_KERNEL);
> +	if (!madvise_range->vmas)
> +		return -ENOMEM;
> +
> +	vm_dbg(&vm->xe->drm, "VMA's in range: start=0x%016llx, end=0x%016llx", addr, addr + range);
> +
> +	drm_gpuvm_for_each_va_range(gpuva, &vm->gpuvm, addr, addr + range) {
> +		struct xe_vma *vma = gpuva_to_vma(gpuva);
> +
> +		if (xe_vma_bo(vma))
> +			madvise_range->has_bo_vmas = true;
> +		else if (xe_vma_is_cpu_addr_mirror(vma))
> +			madvise_range->has_svm_vmas = true;
> +		else if (xe_vma_is_userptr(vma))
> +			madvise_range->has_userptr_vmas = true;
> +
> +		if (madvise_range->num_vmas == max_vmas) {
> +			max_vmas <<= 1;
> +			__vmas = krealloc(madvise_range->vmas,
> +					  max_vmas * sizeof(*madvise_range->vmas),
> +					  GFP_KERNEL);
> +			if (!__vmas) {
> +				kfree(madvise_range->vmas);
> +				return -ENOMEM;
> +			}
> +			madvise_range->vmas = __vmas;
> +		}
> +
> +		madvise_range->vmas[madvise_range->num_vmas] = vma;
> +		(madvise_range->num_vmas)++;
> +	}
> +
> +	if (!madvise_range->num_vmas)
> +		kfree(madvise_range->vmas);
> +
> +	vm_dbg(&vm->xe->drm, "madvise_range-num_vmas = %d\n", madvise_range->num_vmas);
> +
> +	return 0;
> +}
> +
> +static void madvise_preferred_mem_loc(struct xe_device *xe, struct xe_vm *vm,
> +				      struct xe_vma **vmas, int num_vmas,
> +				      struct drm_xe_madvise *op)
> +{
> +	/* Implementation pending */
> +}
> +
> +static void madvise_atomic(struct xe_device *xe, struct xe_vm *vm,
> +			   struct xe_vma **vmas, int num_vmas,
> +			   struct drm_xe_madvise *op)
> +{
> +	/* Implementation pending */
> +}
> +
> +static void madvise_pat_index(struct xe_device *xe, struct xe_vm *vm,
> +			      struct xe_vma **vmas, int num_vmas,
> +			      struct drm_xe_madvise *op)
> +{
> +	/* Implementation pending */
> +}
> +
> +typedef void (*madvise_func)(struct xe_device *xe, struct xe_vm *vm,
> +			     struct xe_vma **vmas, int num_vmas,
> +			     struct drm_xe_madvise *op);
> +
> +static const madvise_func madvise_funcs[] = {
> +	[DRM_XE_MEM_RANGE_ATTR_PREFERRED_LOC] = madvise_preferred_mem_loc,
> +	[DRM_XE_MEM_RANGE_ATTR_ATOMIC] = madvise_atomic,
> +	[DRM_XE_MEM_RANGE_ATTR_PAT] = madvise_pat_index,
> +};
> +
> +static u8 xe_zap_ptes_in_madvise_range(struct xe_vm *vm, u64 start, u64 end)
> +{
> +	struct drm_gpuva *gpuva;
> +	struct xe_tile *tile;
> +	u8 id, tile_mask;
> +
> +	lockdep_assert_held_write(&vm->lock);
> +
> +	/* Wait for pending binds */
> +	if (dma_resv_wait_timeout(xe_vm_resv(vm), DMA_RESV_USAGE_BOOKKEEP,
> +				  false, MAX_SCHEDULE_TIMEOUT) <= 0)
> +		XE_WARN_ON(1);
> +
> +	tile_mask = xe_svm_ranges_zap_ptes_in_range(vm, start, end);
> +
> +	drm_gpuvm_for_each_va_range(gpuva, &vm->gpuvm, start, end) {
> +		struct xe_vma *vma = gpuva_to_vma(gpuva);
> +
> +		if (xe_vma_is_cpu_addr_mirror(vma))

I think:

xe_vma_is_cpu_addr_mirror(vma) || xe_vma_is_null(vma)

No need to invalidate NULL VMA's as those mappings are not modified by
madvise (i.e., you can call madvise on NULL mappings but it doesn't
actually do anything).

> +			continue;
> +
> +		for_each_tile(tile, vm->xe, id) {
> +			if (xe_pt_zap_ptes(tile, vma)) {
> +				tile_mask |= BIT(id);
> +
> +				/*
> +				 * WRITE_ONCE pairs with READ_ONCE
> +				 * in xe_vm_has_valid_gpu_mapping()
> +				 */
> +				WRITE_ONCE(vma->tile_invalidated,
> +					   vma->tile_invalidated | BIT(id));
> +			}
> +		}
> +	}
> +
> +	return tile_mask;
> +}
> +
> +static int xe_vm_invalidate_madvise_range(struct xe_vm *vm, u64 start, u64 end)
> +{
> +	u8 tile_mask = xe_zap_ptes_in_madvise_range(vm, start, end);
> +
> +	if (!tile_mask)
> +		return 0;
> +
> +	xe_device_wmb(vm->xe);
> +
> +	return xe_vm_range_tilemask_tlb_invalidation(vm, start, end, tile_mask);
> +}
> +
> +static bool madvise_args_are_sane(struct xe_device *xe, const struct drm_xe_madvise *args)
> +{
> +	if (XE_IOCTL_DBG(xe, !args))
> +		return false;
> +
> +	if (XE_IOCTL_DBG(xe, !IS_ALIGNED(args->start, SZ_4K)))
> +		return false;
> +
> +	if (XE_IOCTL_DBG(xe, !IS_ALIGNED(args->range, SZ_4K)))
> +		return false;
> +
> +	if (XE_IOCTL_DBG(xe, args->range < SZ_4K))
> +		return false;
> +
> +	switch (args->type) {
> +	case DRM_XE_MEM_RANGE_ATTR_PREFERRED_LOC:
> +		if (XE_IOCTL_DBG(xe, args->preferred_mem_loc.migration_policy >
> +				     DRM_XE_MIGRATE_ONLY_SYSTEM_PAGES))
> +			return false;
> +
> +		if (XE_IOCTL_DBG(xe, args->preferred_mem_loc.pad))
> +			return false;
> +
> +		if (XE_IOCTL_DBG(xe, args->atomic.reserved))
> +			return false;
> +		break;
> +	case DRM_XE_MEM_RANGE_ATTR_ATOMIC:
> +		if (XE_IOCTL_DBG(xe, args->atomic.val > DRM_XE_ATOMIC_CPU))
> +			return false;
> +
> +		if (XE_IOCTL_DBG(xe, args->atomic.pad))
> +			return false;
> +
> +		if (XE_IOCTL_DBG(xe, args->atomic.reserved))
> +			return false;
> +
> +		break;
> +	case DRM_XE_MEM_RANGE_ATTR_PAT:
> +		/*TODO: Add valid pat check */
> +		break;
> +	default:
> +		if (XE_IOCTL_DBG(xe, 1))
> +			return false;
> +	}
> +
> +	if (XE_IOCTL_DBG(xe, args->reserved[0] || args->reserved[1]))
> +		return false;
> +
> +	return true;
> +}
> +
> +/**
> + * xe_vm_madvise_ioctl - Handle MADVise ioctl for a VM
> + * @dev: DRM device pointer
> + * @data: Pointer to ioctl data (drm_xe_madvise*)
> + * @file: DRM file pointer
> + *
> + * Handles the MADVISE ioctl to provide memory advice for vma's within
> + * input range.
> + *
> + * Return: 0 on success or a negative error code on failure.
> + */
> +int xe_vm_madvise_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
> +{
> +	struct xe_device *xe = to_xe_device(dev);
> +	struct xe_file *xef = to_xe_file(file);
> +	struct drm_xe_madvise *args = data;
> +	struct xe_vmas_in_madvise_range madvise_range = {.addr = args->start,
> +							 .range =  args->range, };
> +	struct xe_vm *vm;
> +	struct drm_exec exec;
> +	int err, attr_type;
> +
> +	vm = xe_vm_lookup(xef, args->vm_id);
> +	if (XE_IOCTL_DBG(xe, !vm))
> +		return -EINVAL;
> +
> +	if (!madvise_args_are_sane(vm->xe, args)) {
> +		err = -EINVAL;
> +		goto put_vm;
> +	}
> +

I think as this code can modify the ranges during a VMA split, you will
need to ensure all queued unmaps prior to this are complete.

So call xe_svm_flush(vm) prior to taking any locks.

Looks good otherwise.

Matt

> +	err = down_write_killable(&vm->lock);
> +	if (err)
> +		goto put_vm;
> +
> +	if (XE_IOCTL_DBG(xe, xe_vm_is_closed_or_banned(vm))) {
> +		err = -ENOENT;
> +		goto unlock_vm;
> +	}
> +
> +	err = xe_vm_alloc_madvise_vma(vm, args->start, args->range);
> +	if (err)
> +		goto unlock_vm;
> +
> +	err = get_vmas(vm, &madvise_range);
> +	if (err || !madvise_range.num_vmas)
> +		goto unlock_vm;
> +
> +	if (madvise_range.has_bo_vmas) {
> +		drm_exec_init(&exec, DRM_EXEC_IGNORE_DUPLICATES | DRM_EXEC_INTERRUPTIBLE_WAIT, 0);
> +		drm_exec_until_all_locked(&exec) {
> +			for (int i = 0; i < madvise_range.num_vmas; i++) {
> +				struct xe_bo *bo = xe_vma_bo(madvise_range.vmas[i]);
> +
> +				if (!bo)
> +					continue;
> +				err = drm_exec_lock_obj(&exec, &bo->ttm.base);
> +				drm_exec_retry_on_contention(&exec);
> +				if (err)
> +					goto err_fini;
> +			}
> +		}
> +	}
> +
> +	if (madvise_range.has_userptr_vmas) {
> +		err = down_read_interruptible(&vm->userptr.notifier_lock);
> +		if (err)
> +			goto err_fini;
> +	}
> +
> +	if (madvise_range.has_svm_vmas) {
> +		err = down_read_interruptible(&vm->svm.gpusvm.notifier_lock);
> +		if (err)
> +			goto unlock_userptr;
> +	}
> +
> +	attr_type = array_index_nospec(args->type, ARRAY_SIZE(madvise_funcs));
> +	madvise_funcs[attr_type](xe, vm, madvise_range.vmas, madvise_range.num_vmas, args);
> +
> +	err = xe_vm_invalidate_madvise_range(vm, args->start, args->start + args->range);
> +
> +	if (madvise_range.has_svm_vmas)
> +		xe_svm_notifier_unlock(vm);
> +
> +unlock_userptr:
> +	if (madvise_range.has_userptr_vmas)
> +		up_read(&vm->userptr.notifier_lock);
> +err_fini:
> +	if (madvise_range.has_bo_vmas)
> +		drm_exec_fini(&exec);
> +	kfree(madvise_range.vmas);
> +	madvise_range.vmas = NULL;
> +unlock_vm:
> +	up_write(&vm->lock);
> +put_vm:
> +	xe_vm_put(vm);
> +	return err;
> +}
> diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.h b/drivers/gpu/drm/xe/xe_vm_madvise.h
> new file mode 100644
> index 000000000000..b0e1fc445f23
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_vm_madvise.h
> @@ -0,0 +1,15 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +
> +#ifndef _XE_VM_MADVISE_H_
> +#define _XE_VM_MADVISE_H_
> +
> +struct drm_device;
> +struct drm_file;
> +
> +int xe_vm_madvise_ioctl(struct drm_device *dev, void *data,
> +			struct drm_file *file);
> +
> +#endif
> -- 
> 2.34.1
> 
