Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E808C87FD3
	for <intel-xe@archiver.kernel.org>; Wed,  6 Aug 2025 16:20:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36A1410E099;
	Wed,  6 Aug 2025 16:20:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Vlu14Bza";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B50D10E099
 for <intel-xe@lists.freedesktop.org>; Wed,  6 Aug 2025 16:20:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754497224; x=1786033224;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=ZJXBPv9s3/xbcO5VU3xB3XxRFbXdmhwMHQ38gLs4B3Q=;
 b=Vlu14Bzax2HloNIvJV4pXC8MdMRoGBdSQ9mGr3wf2dzoPzX+OxXCCYXp
 Scq0q/5pr5lIgQPjBLDlqch/0Eig3QI2Jn/66uZ6XN6vAlU/NIzmJk4yf
 Vjg8WkdjzwnceZYGYijYS+4L6N0cGBEnjj2gTtMF8CEwLJC7hKt/3/hbB
 1ZeURtZd6yETNpGc5TKJuACtToezcjsl0GGT7ATB92+V9LgbBQl9KTBl2
 4wIlsryG9sQQ6ZiTPdXtmAIbQHFp2fQo/S/+aEKwdNWHB4tzb/43P7R2A
 jrNfgSBHgXIKNtGIJcN/I0vQ1/raEkK7l/Mm3DfJUJMUQsdIt7JdNVFNL A==;
X-CSE-ConnectionGUID: teEcaFobRtmipU+IyxgUeQ==
X-CSE-MsgGUID: vG7Q4b9RRzGFHFiadPRPLw==
X-IronPort-AV: E=McAfee;i="6800,10657,11514"; a="67089060"
X-IronPort-AV: E=Sophos;i="6.17,268,1747724400"; d="scan'208";a="67089060"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Aug 2025 09:20:23 -0700
X-CSE-ConnectionGUID: /Z7oKvCzR7aisZzwny15dw==
X-CSE-MsgGUID: i3O/6U+CQjutpqnx6Qaabw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,268,1747724400"; d="scan'208";a="170088440"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Aug 2025 09:20:23 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Wed, 6 Aug 2025 09:20:22 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Wed, 6 Aug 2025 09:20:22 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (40.107.220.64)
 by edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Wed, 6 Aug 2025 09:20:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OqclnT4V+gXae19H2ntFTv7aHmD03bJtO99R8FviEx7ZbPK4Max6VmM6GC81dmk1XigCa0E9Ue68hfGWsa+m+nYWo0+snxffXMqAGR/wEppjMDXF5WDR8AWpjb1EH6sMc32oR49dhC2RpyZlwmyFt/gOJCVsPhi3NnImbAgBKWKimziLtc8Mixys6IkLfV6yPJWiukFSJVaIg2TK4YoR3J4xCuvjSoqSDFCcwfAT80s+pejGoXmNzPwkIQPcOc9UYHdpQFRKelz2ixR9Z63g40bquPhljV1oDNCGFzABC9LUwpWjU7V6HljAuZAQJGvYViGYVcI39yEKlFvwjEyZKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cptU6rDaH+ZZ4mLXzFzFtFQtdvjy3w3ylLaQv8ew7EQ=;
 b=crzsp5ROzNq1AwO1fiXbr50I4opazPzG5hkzyyzfV0ammwnGe7GY/rigXXb1+LetvxpNuqZPj6Pn+kSaLmM71A9ORdpms+Rt8EElHB/UtCmV4o2edf/HhYHGkNlpwWMeQ6am9tuW0hpzODpQStNQTUl7gBNKa5Y1lrAFLSP3oEhK9rxkxlcjZt3uJvNhttgmdKD+Q+jKqQPM3idRr4aePaC+oig40FT0rZkf/hTmyvKjZmvaX3nr21jncVKF8zl+mo1ELH0QnuMCf43ILhrgLA4yj2yxRBrQz76UuEVmcd8eSTHsmFiGQhjZfNR3iPLSuGp6Shcw0hChoPT4dGo6Nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CH3PR11MB8415.namprd11.prod.outlook.com (2603:10b6:610:17b::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.17; Wed, 6 Aug
 2025 16:20:20 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.8989.018; Wed, 6 Aug 2025
 16:20:20 +0000
Date: Wed, 6 Aug 2025 09:20:17 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: "Summers, Stuart" <stuart.summers@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "K V P, 
 Satyanarayana" <satyanarayana.k.v.p@intel.com>, "Wajdeczko, Michal"
 <Michal.Wajdeczko@intel.com>
Subject: Re: [PATCH v3 1/2] drm/xe/vf: Refactor CCS save/restore to use
 default migration context
Message-ID: <aJOAwY5f1IMvofxb@lstrano-desk.jf.intel.com>
References: <20250806082910.15845-1-satyanarayana.k.v.p@intel.com>
 <20250806082910.15845-2-satyanarayana.k.v.p@intel.com>
 <ce1e44770953b9a748bf5111b50fb280a03a17d1.camel@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ce1e44770953b9a748bf5111b50fb280a03a17d1.camel@intel.com>
X-ClientProxiedBy: MW4PR03CA0300.namprd03.prod.outlook.com
 (2603:10b6:303:b5::35) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CH3PR11MB8415:EE_
X-MS-Office365-Filtering-Correlation-Id: 20dd8d50-dbe3-49df-6fc4-08ddd505235a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?fptFZdkyfA0Y6BwMRGXV8h2MC2e5M8mQ8PBfxAiKUmwn+cQqddXg8p2jnU?=
 =?iso-8859-1?Q?G+OV5Nz/gLyHYHKgZp+BDqhwgCtZQ1XsI8gMDDraLxPHCfV1sMJkSEf/s2?=
 =?iso-8859-1?Q?u0Mmbh5BWKFIQXrtEW3dBmGXWr0K1Xb7Ox/Mr89bqU5Wicw6698iPjfZig?=
 =?iso-8859-1?Q?oSbF0jb1zP63A/OKidN/6zeZOxRWBQ3DUgFnZZyJlJAbvbEq2J1FJwsyyz?=
 =?iso-8859-1?Q?sifos1ShgQASa0Oj6q8Cx4+rC3Gyyv/HrEPNuGwWNrwMc9/KOESYZ+an27?=
 =?iso-8859-1?Q?XWmrfRNqS1PqppfNOzl2quv0024XArtZyo2e7+pogBOk0npQRfrlXVI+Yk?=
 =?iso-8859-1?Q?5jdja6Sg6vxYyvpZQYlAGJRspseOJi+IXQwPBuqZ57rZebbPhLFMmJ6cqw?=
 =?iso-8859-1?Q?/nnZVTDBHkiAVlr2Qj7Exh2HR4oxrE3OVqNZc4AhY5UEnQNc4X1QFa94Jl?=
 =?iso-8859-1?Q?/1/iKCm2VdftfoF/Hmf1XADxpjyBOozNYvdqPHQ6gWwrGNRTgMhWo3hGTv?=
 =?iso-8859-1?Q?F5t0ypYBwLdtiSCafMB+tEcfcHXRxwTSFf15tW42bLQlde9ZsVhrV8A8t9?=
 =?iso-8859-1?Q?hPP6rVUYwaQGo01v1dX0iKLJGmwBGz+06k/NEZwYdutRL1FiZ8sTN9cZoV?=
 =?iso-8859-1?Q?YZr8qxQqrxlR1/xIoeRM2qMgaHrVm6cbPI6JtDS5U2AlofrcFTutudm8rP?=
 =?iso-8859-1?Q?p4vkIyFmPH10F6T0JMbwrV2JFapASc6w2BYUwIV/c16coT3F/FK5dFzQzH?=
 =?iso-8859-1?Q?cPb5PECNQ/69CTlDmFpeu0/JDXqvzxkAVdie0D0IM7DFywcvZz8L4B8MXW?=
 =?iso-8859-1?Q?0litJ8/bVbS5oEmjYTBlu6R93LpmBr7agyuLeHAgc3pmt4Te4zA0RMJBN0?=
 =?iso-8859-1?Q?W/vTyC7WY+F2pZ9p8L7IbG2npNh75WYYMAyt5hjcKZfLnzgHfluRO/H+p/?=
 =?iso-8859-1?Q?zil1Wv5nxO+MXfVKzAeFKy52XKQBdCd1dXKJ7bt0E8BScXJm74tJQE0SZI?=
 =?iso-8859-1?Q?mp3XWUxuPYEQZOG44WUSOksSWWa4HJsbp+U9m5FGYxHKECMY5uhiJgrNYN?=
 =?iso-8859-1?Q?DfbGNfL49MV65KLmlF9v56xfbPhS4Mjn/w59UFo5KLrsZAhsRnLfYRKIm5?=
 =?iso-8859-1?Q?3ZWqdKwDBrHRMsPxURUIfa589yY00oMW8q6LvEUVtwg67QkIIMe3Kuy7CS?=
 =?iso-8859-1?Q?lWU1T77CGMj8n7w6ASkJR/08Q2JfnN0Yrm/D9FzCn17vzND+NxvKOmt64O?=
 =?iso-8859-1?Q?Aou6DBg55BeOzQJWC2irgN1wJAlGPjzyPNinJAbIBdyyktvfDVhfJnc1uf?=
 =?iso-8859-1?Q?OTta4QKhzV9maK/AxrmogDhCK8k9s8zBgyAlJK9oQLQR2RJbZn0HdRxRmX?=
 =?iso-8859-1?Q?ksfTABnBw3pHBM0ic/jOihScQQbm7vYMz4eKVf/cFs+B0Dulnale1hOIkx?=
 =?iso-8859-1?Q?wQjCccg3tTyNOEN2m+s89VFSTq+Vvxo6T1yp5qN/X40DF6z+8c4JEHbz+T?=
 =?iso-8859-1?Q?w=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?wGHLwf9vjzXmQJhg0sdeZiYNIsNIud93WFryr6FNDumCc2fGSZLOhd2l11?=
 =?iso-8859-1?Q?otW4Pu8LvX4rI9Nd19j7RbpAZkNTfPHnFJkvZyh0MOFbpiXu1h1tGqUjQR?=
 =?iso-8859-1?Q?AiEzO6iA+aB6hgsalzaTXaQs0FZx73DC0hEmJLExv0qoa0JEIAyxZbEVuS?=
 =?iso-8859-1?Q?B0XFGZqhsKuClHEzR26Q59y1vIiM95FiPQBcf5HGgA0qX9Qm4fPrxUBuI5?=
 =?iso-8859-1?Q?lNRwcNsZWslFRqUuJWXxTTu2yKs6Uo9MwobaheTlkl/6s6IF+KVdF85pyA?=
 =?iso-8859-1?Q?w5H5h4RZCckJt0gIJj7OiRck2oXmv9WMQYt8jxKqHKqBjHE7CNthI4ghNk?=
 =?iso-8859-1?Q?xqkn5+D4Iyear9MEFzBNP2ZL6oNe3WF9T6y8vq4xY5iYoMVsko8Uf0vZd+?=
 =?iso-8859-1?Q?H3ZC1NkaKrguVXj3hoCtPV2f7M8GmtWieIOk5tUdH01QuOtc+GSrNX17Ln?=
 =?iso-8859-1?Q?gYMNEnoDSMse2JTnlcxtf0FnHNGRsMolGIthmApQeSQX24WlhIBoEbULg7?=
 =?iso-8859-1?Q?78eSzfWNGtedNywazKtRSZjHpw7PciUTM1dTQUt2hSkhuvRQFpEsZdTLmM?=
 =?iso-8859-1?Q?eoYpgdx+s3XlYaKlykLDde4/f9H3jGzTO4GDzzxmZZo2c1b+AF0alqkAqd?=
 =?iso-8859-1?Q?havUTwbChcgU8h/rWP4EzySqocphvc862D/VAviZz/jkfzHUcOW/Cge/RO?=
 =?iso-8859-1?Q?eqNZPuhX6vy3Gf3iTYhk7rgdVv69JoZIQgHmWjeFwYKC6uy5ENfzUlNot2?=
 =?iso-8859-1?Q?1xIVyuieUJmVTfdhpb659fnfNxE3jDMoX72E7xg1a90JrLwI2MDYGCn62W?=
 =?iso-8859-1?Q?Fb8uvu5s8WrGptLcnwaVwMg68AnQyS/ANK5qll08W8E8Y8bng47i68pNiX?=
 =?iso-8859-1?Q?rlWUVVFzqo9ovA5GBBgwnODb6mHdxQt3Khq1dfkqlGUK3SBDTrL38xik5J?=
 =?iso-8859-1?Q?YC3kTd4B1nrQ7bxuPKNtiMA71IprQqF0NZ9X/AcO1EtVkIliq910lzrudo?=
 =?iso-8859-1?Q?z14ZqhbTPt32ElLc4GJ9JbcELJGv+ZAoNQ+/VGBVYEpcm0JTCp99nfhYEz?=
 =?iso-8859-1?Q?QDXzREyeor9WY19VXQ10ESIG8/loSR4mzKEuEKVSrrovPrZOZHIaBPunf1?=
 =?iso-8859-1?Q?z/7+cP6mi9rKJau0/pTdY3rp/TwSZEplKduTdd0Zmlvb7tRhbNSsFPqpaf?=
 =?iso-8859-1?Q?M7DQmdmcBfis6Atj7SRIcgtAe2eomRrl9PhHycH6SX17Tc3ziVQfINLr9u?=
 =?iso-8859-1?Q?L22fVLFbIaVYZiPJjxUWleRZSlA68aEsr4bgvr/Go868muaVvVKS7jsMjE?=
 =?iso-8859-1?Q?e1Ec7q+/qntXU7BADJIOnMrFmML4Euy5J0u49PaltcfcB/JIBtyueVBhoD?=
 =?iso-8859-1?Q?UsPm0sSpSd7owAFItjzPQoNvXdeB0ANiFtQD4zP2GpxvwXxBT28OTGcQwq?=
 =?iso-8859-1?Q?kLqNv0OfgUPX+K1RG7pyTJeqJ798/S+ee7UzmWhJkPZbghN5Zfv43TJcAR?=
 =?iso-8859-1?Q?Yjeg/2BvXvJaLGoDa9XIJcpCa/8zOcRKJ1vcKx08AiInjBSuGVlDvN7YRV?=
 =?iso-8859-1?Q?1M6yBhuWVGo5rjSMvC4WOlKWEdmaLPAk+fPkPQt//MlUT1ivDd60AAkcU4?=
 =?iso-8859-1?Q?UEEAy/ru31JRjxZrUAJQhHgJKuF+N7P6O0wjjUbKEPo0KEaDMYFgGlpA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 20dd8d50-dbe3-49df-6fc4-08ddd505235a
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2025 16:20:20.3509 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UFAa4wqMAp0rx9vhR8zlrVi3D/777v0VYvfHdddiRpqOsI6odiscYZjPAjNSgPXvjgOJ8opnY9GL0A6cY3RtRg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8415
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

On Wed, Aug 06, 2025 at 10:08:01AM -0600, Summers, Stuart wrote:
> On Wed, 2025-08-06 at 13:59 +0530, Satyanarayana K V P wrote:
> > Previously, CCS save/restore operations created separate migration
> > contexts with new VM memory allocations, resulting in significant
> > overhead.
> > 
> > This commit eliminates redundant context creation reusing the default
> > migration context by registering new execution queues for CCS save
> > and
> > restore on the existing migrate VM.
> > 
> > Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> > Suggested-by: Matthew Brost <matthew.brost@intel.com>
> > Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> > 
> > ---
> > V2 -> V3:
> > - Fixed review comments (Matthew Brost).
> > 
> > V1 -> V2:
> > - Fixed kernel-doc issues reported by patchworks.
> > ---
> >  drivers/gpu/drm/xe/xe_migrate.c            | 18 ++++----
> >  drivers/gpu/drm/xe/xe_migrate.h            |  2 +-
> >  drivers/gpu/drm/xe/xe_pm.c                 |  3 ++
> >  drivers/gpu/drm/xe/xe_sriov_vf_ccs.c       | 49 ++++++++++++--------
> > --
> >  drivers/gpu/drm/xe/xe_sriov_vf_ccs_types.h |  6 +--
> >  5 files changed, 43 insertions(+), 35 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_migrate.c
> > b/drivers/gpu/drm/xe/xe_migrate.c
> > index 3a276e2348a2..7d3c7c4e2185 100644
> > --- a/drivers/gpu/drm/xe/xe_migrate.c
> > +++ b/drivers/gpu/drm/xe/xe_migrate.c
> > @@ -960,14 +960,14 @@ struct xe_lrc *xe_migrate_lrc(struct xe_migrate
> > *migrate)
> >         return migrate->q->lrc[0];
> >  }
> >  
> > -static int emit_flush_invalidate(struct xe_migrate *m, u32 *dw, int
> > i,
> > +static int emit_flush_invalidate(struct xe_exec_queue *q, u32 *dw,
> > int i,
> >                                  u32 flags)
> >  {
> >         dw[i++] = MI_FLUSH_DW | MI_INVALIDATE_TLB |
> > MI_FLUSH_DW_OP_STOREDW |
> >                   MI_FLUSH_IMM_DW | flags;
> > -       dw[i++] =
> > lower_32_bits(xe_lrc_start_seqno_ggtt_addr(xe_migrate_lrc(m))) |
> > +       dw[i++] = lower_32_bits(xe_lrc_start_seqno_ggtt_addr(q-
> > >lrc[0])) |
> >                   MI_FLUSH_DW_USE_GTT;
> > -       dw[i++] =
> > upper_32_bits(xe_lrc_start_seqno_ggtt_addr(xe_migrate_lrc(m)));
> > +       dw[i++] = upper_32_bits(xe_lrc_start_seqno_ggtt_addr(q-
> > >lrc[0]));
> >         dw[i++] = MI_NOOP;
> >         dw[i++] = MI_NOOP;
> >  
> > @@ -976,7 +976,8 @@ static int emit_flush_invalidate(struct
> > xe_migrate *m, u32 *dw, int i,
> >  
> >  /**
> >   * xe_migrate_ccs_rw_copy() - Copy content of TTM resources.
> > - * @m: The migration context.
> > + * @tile: Tile whose migration context to be used.
> > + * @q : Execution to be used along with migration context.
> >   * @src_bo: The buffer object @src is currently bound to.
> >   * @read_write : Creates BB commands for CCS read/write.
> >   *
> > @@ -987,7 +988,7 @@ static int emit_flush_invalidate(struct
> > xe_migrate *m, u32 *dw, int i,
> >   *
> >   * Return: 0 if successful, negative error code on failure.
> >   */
> > -int xe_migrate_ccs_rw_copy(struct xe_migrate *m,
> > +int xe_migrate_ccs_rw_copy(struct xe_tile *tile, struct
> > xe_exec_queue *q,
> >                            struct xe_bo *src_bo,
> >                            enum xe_sriov_vf_ccs_rw_ctxs read_write)
> >  
> > @@ -995,7 +996,8 @@ int xe_migrate_ccs_rw_copy(struct xe_migrate *m,
> >         bool src_is_pltt = read_write == XE_SRIOV_VF_CCS_READ_CTX;
> >         bool dst_is_pltt = read_write == XE_SRIOV_VF_CCS_WRITE_CTX;
> >         struct ttm_resource *src = src_bo->ttm.resource;
> > -       struct xe_gt *gt = m->tile->primary_gt;
> > +       struct xe_migrate *m = tile->migrate;
> > +       struct xe_gt *gt = tile->primary_gt;
> >         u32 batch_size, batch_size_allocated;
> >         struct xe_device *xe = gt_to_xe(gt);
> >         struct xe_res_cursor src_it, ccs_it;
> > @@ -1078,11 +1080,11 @@ int xe_migrate_ccs_rw_copy(struct xe_migrate
> > *m,
> >  
> >                 emit_pte(m, bb, ccs_pt, false, false, &ccs_it,
> > ccs_size, src);
> >  
> > -               bb->len = emit_flush_invalidate(m, bb->cs, bb->len,
> > flush_flags);
> > +               bb->len = emit_flush_invalidate(q, bb->cs, bb->len,
> > flush_flags);
> >                 flush_flags = xe_migrate_ccs_copy(m, bb, src_L0_ofs,
> > src_is_pltt,
> >                                                   src_L0_ofs,
> > dst_is_pltt,
> >                                                   src_L0, ccs_ofs,
> > true);
> > -               bb->len = emit_flush_invalidate(m, bb->cs, bb->len,
> > flush_flags);
> > +               bb->len = emit_flush_invalidate(q, bb->cs, bb->len,
> > flush_flags);
> >  
> >                 size -= src_L0;
> >         }
> > diff --git a/drivers/gpu/drm/xe/xe_migrate.h
> > b/drivers/gpu/drm/xe/xe_migrate.h
> > index e81ea6b27fb5..9e20da6d58c2 100644
> > --- a/drivers/gpu/drm/xe/xe_migrate.h
> > +++ b/drivers/gpu/drm/xe/xe_migrate.h
> > @@ -124,7 +124,7 @@ struct dma_fence *xe_migrate_copy(struct
> > xe_migrate *m,
> >                                   struct ttm_resource *dst,
> >                                   bool copy_only_ccs);
> >  
> > -int xe_migrate_ccs_rw_copy(struct xe_migrate *m,
> > +int xe_migrate_ccs_rw_copy(struct xe_tile *tile, struct
> > xe_exec_queue *q,
> >                            struct xe_bo *src_bo,
> >                            enum xe_sriov_vf_ccs_rw_ctxs read_write);
> >  
> > diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
> > index 44aaf154ddf7..5e8126ca8e27 100644
> > --- a/drivers/gpu/drm/xe/xe_pm.c
> > +++ b/drivers/gpu/drm/xe/xe_pm.c
> > @@ -209,6 +209,9 @@ int xe_pm_resume(struct xe_device *xe)
> >  
> >         xe_pxp_pm_resume(xe->pxp);
> >  
> > +       if (IS_SRIOV_VF(xe))
> > +               xe_sriov_vf_ccs_register_context(xe);
> > +
> >         drm_dbg(&xe->drm, "Device resumed\n");
> >         return 0;
> >  err:
> > diff --git a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
> > b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
> > index f0ca2a9b2bb7..a87f39eae4dc 100644
> > --- a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
> > +++ b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
> > @@ -8,6 +8,7 @@
> >  #include "xe_bb.h"
> >  #include "xe_bo.h"
> >  #include "xe_device.h"
> > +#include "xe_exec_queue.h"
> >  #include "xe_exec_queue_types.h"
> >  #include "xe_guc_submit.h"
> >  #include "xe_lrc.h"
> > @@ -168,7 +169,7 @@ static int alloc_bb_pool(struct xe_tile *tile,
> > struct xe_tile_vf_ccs *ctx)
> >  
> >  static void ccs_rw_update_ring(struct xe_tile_vf_ccs *ctx)
> >  {
> > -       struct xe_lrc *lrc = xe_migrate_lrc(ctx->migrate);
> > +       struct xe_lrc *lrc = ctx->q->lrc[0];
> >         u64 addr = xe_sa_manager_gpu_addr(ctx->mem.ccs_bb_pool);
> >         u32 dw[10], i = 0;
> >  
> > @@ -183,13 +184,12 @@ static void ccs_rw_update_ring(struct
> > xe_tile_vf_ccs *ctx)
> >         xe_lrc_set_ring_tail(lrc, lrc->ring.tail);
> >  }
> >  
> > -static int register_save_restore_context(struct xe_migrate *m,
> > -                                        enum xe_sriov_vf_ccs_rw_ctxs
> > ctx_id)
> > +static int register_save_restore_context(struct xe_tile_vf_ccs *ctx)
> >  {
> >         int err = -EINVAL;
> >         int ctx_type;
> >  
> > -       switch (ctx_id) {
> > +       switch (ctx->ctx_id) {
> >         case XE_SRIOV_VF_CCS_READ_CTX:
> >                 ctx_type = GUC_CONTEXT_COMPRESSION_SAVE;
> >                 break;
> > @@ -200,7 +200,7 @@ static int register_save_restore_context(struct
> > xe_migrate *m,
> >                 return err;
> >         }
> >  
> > -       xe_guc_register_exec_queue(xe_migrate_exec_queue(m),
> > ctx_type);
> > +       xe_guc_register_exec_queue(ctx->q, ctx_type);
> >         return 0;
> >  }
> >  
> > @@ -225,7 +225,7 @@ int xe_sriov_vf_ccs_register_context(struct
> > xe_device *xe)
> >  
> >         for_each_ccs_rw_ctx(ctx_id) {
> >                 ctx = &tile->sriov.vf.ccs[ctx_id];
> > -               err = register_save_restore_context(ctx->migrate,
> > ctx_id);
> > +               err = register_save_restore_context(ctx);
> >                 if (err)
> >                         return err;
> >         }
> > @@ -236,13 +236,14 @@ int xe_sriov_vf_ccs_register_context(struct
> > xe_device *xe)
> >  static void xe_sriov_vf_ccs_fini(void *arg)
> >  {
> >         struct xe_tile_vf_ccs *ctx = arg;
> > -       struct xe_lrc *lrc = xe_migrate_lrc(ctx->migrate);
> > +       struct xe_lrc *lrc = ctx->q->lrc[0];
> >  
> >         /*
> >          * Make TAIL = HEAD in the ring so that no issues are seen if
> > Guc
> >          * submits this context to HW on VF pause after unbinding
> > device.
> >          */
> >         xe_lrc_set_ring_tail(lrc, xe_lrc_ring_head(lrc));
> > +       xe_exec_queue_put(ctx->q);
> >  }
> >  
> >  /**
> > @@ -258,8 +259,9 @@ int xe_sriov_vf_ccs_init(struct xe_device *xe)
> >  {
> >         struct xe_tile *tile = xe_device_get_root_tile(xe);
> >         enum xe_sriov_vf_ccs_rw_ctxs ctx_id;
> > -       struct xe_migrate *migrate;
> >         struct xe_tile_vf_ccs *ctx;
> > +       struct xe_exec_queue *q;
> > +       u32 flags;
> >         int err;
> >  
> >         xe_assert(xe, IS_SRIOV_VF(xe));
> > @@ -270,27 +272,25 @@ int xe_sriov_vf_ccs_init(struct xe_device *xe)
> >                 ctx = &tile->sriov.vf.ccs[ctx_id];
> >                 ctx->ctx_id = ctx_id;
> >  
> > -               migrate = xe_migrate_alloc(tile);
> > -               if (!migrate) {
> > -                       err = -ENOMEM;
> > +               flags = EXEC_QUEUE_FLAG_KERNEL |
> > +                       EXEC_QUEUE_FLAG_PERMANENT |
> > +                       EXEC_QUEUE_FLAG_MIGRATE;
> 
> When USM is supported, we also set EXEC_QUEUE_FLAG_HIGH_PRIORITY for
> the migration context. Is there a reason not to do that here?
> 

I don't think EXEC_QUEUE_FLAG_HIGH_PRIORITY applies here as this is a
special queue that is only run upon VF save / restore, so I don't think
it would be subject to normal scheduling polices and also it should have
exclusive execution when it runs, at least within a VF.

> Otherwise the change makes sense to me. We still have a unique queue
> here, just not the VM creation per VF which I agree seems like a good
> idea.
> 

I agree this patch LGTM:
Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> Thanks,
> Stuart
> 
> > +               q = xe_exec_queue_create_bind(xe, tile, flags, 0);
> > +               if (IS_ERR(q)) {
> > +                       err = PTR_ERR(q);
> >                         goto err_ret;
> >                 }
> > -
> > -               err = xe_migrate_init(migrate);
> > -               if (err)
> > -                       goto err_ret;
> > -
> > -               ctx->migrate = migrate;
> > +               ctx->q = q;
> >  
> >                 err = alloc_bb_pool(tile, ctx);
> >                 if (err)
> > -                       goto err_ret;
> > +                       goto err_free_queue;
> >  
> >                 ccs_rw_update_ring(ctx);
> >  
> > -               err = register_save_restore_context(ctx->migrate,
> > ctx_id);
> > +               err = register_save_restore_context(ctx);
> >                 if (err)
> > -                       goto err_ret;
> > +                       goto err_free_queue;
> >  
> >                 err = devm_add_action_or_reset(xe->drm.dev,
> >                                                xe_sriov_vf_ccs_fini,
> > @@ -301,6 +301,9 @@ int xe_sriov_vf_ccs_init(struct xe_device *xe)
> >  
> >         return 0;
> >  
> > +err_free_queue:
> > +       xe_exec_queue_put(q);
> > +
> >  err_ret:
> >         return err;
> >  }
> > @@ -319,7 +322,7 @@ int xe_sriov_vf_ccs_attach_bo(struct xe_bo *bo)
> >  {
> >         struct xe_device *xe = xe_bo_device(bo);
> >         enum xe_sriov_vf_ccs_rw_ctxs ctx_id;
> > -       struct xe_migrate *migrate;
> > +       struct xe_tile_vf_ccs *ctx;
> >         struct xe_tile *tile;
> >         struct xe_bb *bb;
> >         int err = 0;
> > @@ -334,8 +337,8 @@ int xe_sriov_vf_ccs_attach_bo(struct xe_bo *bo)
> >                 /* bb should be NULL here. Assert if not NULL */
> >                 xe_assert(xe, !bb);
> >  
> > -               migrate = tile->sriov.vf.ccs[ctx_id].migrate;
> > -               err = xe_migrate_ccs_rw_copy(migrate, bo, ctx_id);
> > +               ctx = &tile->sriov.vf.ccs[ctx_id];
> > +               err = xe_migrate_ccs_rw_copy(tile, ctx->q, bo,
> > ctx_id);
> >         }
> >         return err;
> >  }
> > diff --git a/drivers/gpu/drm/xe/xe_sriov_vf_ccs_types.h
> > b/drivers/gpu/drm/xe/xe_sriov_vf_ccs_types.h
> > index e240f3fd18af..1add0541aed8 100644
> > --- a/drivers/gpu/drm/xe/xe_sriov_vf_ccs_types.h
> > +++ b/drivers/gpu/drm/xe/xe_sriov_vf_ccs_types.h
> > @@ -41,11 +41,11 @@ struct xe_sa_manager;
> >  struct xe_tile_vf_ccs {
> >         /** @id: Id to which context it belongs to */
> >         enum xe_sriov_vf_ccs_rw_ctxs ctx_id;
> > -       /** @migrate: Migration helper for save/restore of CCS data
> > */
> > -       struct xe_migrate *migrate;
> > +       /** @q: exec queues used for migration */
> > +       struct xe_exec_queue *q;
> >  
> >         struct {
> > -               /** @ccs_rw_bb_pool: Pool from which batch buffers
> > are allocated. */
> > +               /** @ccs_bb_pool: Pool from which batch buffers are
> > allocated. */
> >                 struct xe_sa_manager *ccs_bb_pool;
> >         } mem;
> >  };
> 
