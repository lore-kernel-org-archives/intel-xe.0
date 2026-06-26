Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78A3ECDE008
	for <intel-xe@archiver.kernel.org>; Fri, 26 Jun 2026 09:21:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3370710E327;
	Fri, 26 Jun 2026 09:21:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="A6v2FR/J";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B37510E327
 for <intel-xe@lists.freedesktop.org>; Fri, 26 Jun 2026 09:21:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782465667; x=1814001667;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=pB9xiSeamUZQJu8eJRWgp8jyvwrJJ1M2YIWanUxd8/M=;
 b=A6v2FR/J6E7rwQBTUtlpc8gGRg1KGILRgehr6qgvqUAxZ/t7OjaZUZq9
 x35pbPnKqvL0ERSi3WzpoNaFrSccjhHg+EP/vXhuEVNqzZ47pItG25vUc
 jVcpqp6bRadA3W3ru9jYLyvRJInKx8KEOvtH6vSNSHgrfqGkdB8mwCXx2
 /V7G1Ytjd3pXKgWAOMi/xfnk46X/ckd+qlWsikCO0SuaFcBX/HkZH5h5v
 DDmIsaDF/uo/Ktml2OuVs0jpp2+nDKKX2s75MGq4kxfpYaM7k0rNkO0Xv
 lH0aObfxuHNSo+SJabH+StIZgGgCXkqoRiXWeq3bvSSHOb83GDAGjtsf9 A==;
X-CSE-ConnectionGUID: Gyc5Pt/HStSR57IqzpHiEA==
X-CSE-MsgGUID: kszodNeGQfywihcKwlrKGQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11828"; a="83315159"
X-IronPort-AV: E=Sophos;i="6.24,226,1774335600"; d="scan'208";a="83315159"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2026 02:21:07 -0700
X-CSE-ConnectionGUID: qBqjF7fgRASMRc+uXSHQ5Q==
X-CSE-MsgGUID: CfuwHXgvQN2XltE8I7hQVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,226,1774335600"; d="scan'208";a="249626196"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2026 02:21:07 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 26 Jun 2026 02:21:06 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 26 Jun 2026 02:21:06 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.3) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 26 Jun 2026 02:21:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DEtCftHBntGwXq5eP/SlMGJnnW3cZuLvFfoJEllAqU0NbPvKTQbct1y5ufuIwzVjA17h5vp2Mcw+r5cYLDpWwRH6YiNRl/dV3x7L0Bx96ZKUqKuRAjQmYMs+5J0ByvTo5jW5TeiPsfgj1NeTD63fFYcLA4zqd6TZOZnZh3wplrJO7QEkDKtWQbqsyY2Djg88MRXh6TYYQG6bHAjx1vLLlTq8xKvsqTgpIpP6IRdyVqrV15UJVINoEYZ4TduUg/hq8BUwwKjd5EQe/h62j5DW+nyS9rvLGq2y8IsFf5HRbInerx0pz3SIe0pXPJDimezZU2wlnrzUYby4ZIRMnzQXgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mag0Sj9c2HERLjOQDkMdq4vSRBBM/bNUoA6AEDk/xVk=;
 b=vLJ8OACZ0D8fI8XxWRlgvtxFTv23thnRyIsljpBmmiE0sRrhlA67r/jPjXGX4Dsl8+R2jRgiOnREuoeu0TUeCCL0EJMK4mmptFNlxlARIFYYuo05k/AcM1UOUJR3IYSK2jS1hK2kfX9OTpoxWUY+6uHbFBY/EnDluqE3UObKhZT3/BXooK4ABJaE+xkovJq/FLU0qc55keSWKyYvPtK1RxZg9pgoB6x+O0+f67Q6IusWFq9qWp1aF5ReWUWpk+E9x8L5dUK3ulas4P49RhOgGCIBX1SH34hpjML3Nm4/+vh/RnhFpOkswsvU89ba55xBreUDdZsbccUHc45PsF9MJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA1PR11MB8837.namprd11.prod.outlook.com (2603:10b6:806:468::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.19; Fri, 26 Jun
 2026 09:21:03 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%4]) with mapi id 15.21.0159.016; Fri, 26 Jun 2026
 09:21:03 +0000
Date: Fri, 26 Jun 2026 02:21:01 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Martin Hodo <martin.hodo@intel.com>
Subject: Re: [PATCH 1/2] drm/xe: Fix memory leak in
 exec_queue_set_hang_replay_state()
Message-ID: <aj5EfbsJ70zFnncT@gsse-cloud1.jf.intel.com>
References: <20260624111421.1258364-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260624111421.1258364-1-michal.winiarski@intel.com>
X-ClientProxiedBy: SJ0PR05CA0037.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::12) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA1PR11MB8837:EE_
X-MS-Office365-Filtering-Correlation-Id: 8268b275-c6af-412e-0863-08ded3643eaa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|366016|1800799024|376014|18002099003|22082099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: cuOaWMZv/q5LxkA/I9Z6niRK31SZs3OIsz45BL8cuBfBI0kqr2rHGJeb3fJWMtOXi152B79FTuxTKOE8G4q1LSZGZS00q2z8WcN1YEFgspRYcajspANJqxThVkHyacU05qKmxNZq8UDnmOIomanyQvKDPR7O8EOGBmMnNYNPheNryd+w3WGawMtWDUpdH0kqjMSD251Vi+aHSAUN4uUAm56MH15bS859mLwD2gvtgr0grDDPCkdtFKPmWG4Samm2bt3bE28PrP9h4GwGxn1JNWI/9Iv2nVNeLY4bseg7fPVJYp5RXKnjoeWK0/nVfXspnArlxbebAM23l5RY0RDNNeTSKSAp2BDmCX/e+1TkSfXqp9WYDX2+TCvuS/vK5qnPeecmh3BDasRlAyytKzcVcKAUJ/v797/m9AFAimH0dPHLvDdBuBTwVCB8gY0Z30yWEZLTu9l6gO3EKFAj9MUOXVA1CWjVY2AMWsXVTbODrzlgAiDvkwJs6xRIG38MyRyUOMqYZcncETq41s26+9aBgMF5d/HcZcpVUqOGtmxbgyPbmz70TILsQZ/t5tbS11EIxXJUOP5dGmR49DfCFGkW+TSxt9X/n43gQ4zzW8SfvtWpIO2anhrh1rgzdPAdI05VsBZNgU4yD74Y3pfZHiZTVPDn4QNjEy/96LVaMEz/VAg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(18002099003)(22082099003)(56012099006)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V1lnRHgvbXRIaFg0L3F6L1VKSnBSeVdvUnd6VDAycStJdVB1UHErSVZaMHZt?=
 =?utf-8?B?RUMrN0pzM2k2RGt5aEQ1aS9IYlRoUnB2RGxudzhoVFRHRnA2UittdlRWbXow?=
 =?utf-8?B?QlBtOHJQTU9wZlRhTk5Qd3JWaFp3a1pDbzBXUlRSZ21VREQvVFdJU0FHK2gx?=
 =?utf-8?B?eDhobEpHQ2lSengrNGFab1VxSVhtczdUK3REam9uODBzMTFvY2JyK0pOZ3lK?=
 =?utf-8?B?WXNhZm9CTXdvUjNOTi9JY2QxNVFMR2ZtR2ZLaStKcW05SnoxNXJiZ3I3UDRo?=
 =?utf-8?B?ekFpcHhITURQMDdrV2Q5SHlvK0Fld0lpVGZmcDMrTDhxSlA2YytiMDZoTys2?=
 =?utf-8?B?UDhYM3B1elVCWXB2cXhIOWZvYmVJclRueTVVLzBldUc0bU9SRUJMY3M5ejBi?=
 =?utf-8?B?d1RKNGFlQWRSZlA4czNmVURmZEwzdXpVNUFJVHBvYU9ibjcxVUs3YVVUTDRp?=
 =?utf-8?B?THQvUTJDb25HSXhIZ3JhZFFPNWMza3NnYU15TTZ1UFNPYk1KazBMdDl2bmkw?=
 =?utf-8?B?emVzeFExbnk5QUlTUy9EY0s4UldZT3liZTRKUmt4TEtGNjBFVnV0ZitTWllD?=
 =?utf-8?B?ZkFyYXVFUHpwcUNFOWJjK1gyMVEzSjhnalNuMTFhZEhLRmc0ODk1cmYvQ1dF?=
 =?utf-8?B?VldwSW91Z1JqK2FZSytmOHVRUGtmNnlhalZXRFA0MkRlZHVFMCt3WXFYY2sz?=
 =?utf-8?B?eUpwODhkMFAzZVVjVDNGMkU0QThWNkNydkp3b1R4V1FaeVpWdUNZaTYxakFw?=
 =?utf-8?B?RnJieTFmKzF5aHYwSE1kMlY1bm95enp3V09zMjRQdVB3NWg1b2tORUpIb2JP?=
 =?utf-8?B?bSs4UzlkeXFiYUlaRU9JNFBTRDIzV3FPOE52YzlrV1hWL2t4dncza2Nrc2Nz?=
 =?utf-8?B?emJlSm5HWnpVa2ErYmdRVEVpMjhYNE9odWlvNDRYWHRoVm9aMCtUZ2M0NlFP?=
 =?utf-8?B?aUxnbXhUdGhITEFDZFZFbCtjdmxTNk5vb2VHLzhxa1hnV2xRR3VLaGRRTFAr?=
 =?utf-8?B?RVdrNTRhRGswY0IySFRuUGF6UUNjTk1YNHJiTXhXWDlVQ0NFdWtNbkNVVWMz?=
 =?utf-8?B?MitTb01kVlFGN2s5Sm9VOENUL2JBWmxYUHF0NVlBRlRuNnNHQm15d3E3VGhO?=
 =?utf-8?B?emljTWRaUDlOcTVMZlpEZDJKMEdyQW5HcS9scXRWdW5IbjJYUkgySjg0VTFk?=
 =?utf-8?B?L1JWM3d3RzNOUTM2bk1iRW1vYkFOM2FKMlppZ2RCa0VSaVhsR1QvZDdlUmUx?=
 =?utf-8?B?WWhxdU95SVlwSmZSNWlPRkJTQngyMVBsZ1VLRms5TmlBVm1aVmpBUUtUUFZU?=
 =?utf-8?B?RVpwOVdRZGw0SnpQZEtzaXdrZFR6dENuTW5NVU9XUm9FOEVmdFZXMXQ2Tnpq?=
 =?utf-8?B?VEtKcW5UdHYrbi9xMGhkdE5qY2hoUytpMlVmcFhlaDFBa2lGVGNmNmhUd1Zq?=
 =?utf-8?B?cEo3VmQrTU9ITTVvV0RNU1IvbmFScHk1Q2s1UkZIbXVyUGgyYlZWZWI4Sks5?=
 =?utf-8?B?UFNtM3FVSjNsYWcyUHJtWWJXVDZuVTBPVlVydGNpaHdpSS9WeEIzNDVQYWo3?=
 =?utf-8?B?Z2hqcE9XUjZkemN1VWxsdHVLbllUZkc5R2JIb2VEZDNFSjVjVEFwbi9qMU44?=
 =?utf-8?B?RWdMd1QzU0RCbVZXa21tWGhwZjY4ajNuSTRFUHFUanE1cG5odlIvcU1pMTB0?=
 =?utf-8?B?bHBBaDBsRmlsOGtDcHBlaUFvOFdEZ0tYMkVmcVhUT05pL2FTZFBUeS9Xa3RI?=
 =?utf-8?B?QmVlRC8xaVlkYjdINjZoNm10VWliQlpLTzNOUjFuR25NU3lRMnJPVFZiRmhG?=
 =?utf-8?B?N2I0WDB0NWJDUzJaQlVmSkNjZTIwcHRGd3ZzOTg0TmFlN1cwZjJIbnc1b2Zz?=
 =?utf-8?B?VElGOUl4SWRZM05qeG1Dclh4K05CbldFSHZsSzN6S1RVdnM0SU5rQ1hlZ1BN?=
 =?utf-8?B?VFdwRGRoaWVKMVZuaFc0L042YmdmbW1YT1VNUFB6aDI5THB0QlEzYzByL1JT?=
 =?utf-8?B?Skt4SGM4eUMxQnU3L3Z5bFBHTHhLSGpod0ZtMmUwZGJXeG5halMvNXArdjVZ?=
 =?utf-8?B?b3FuYWxWUFJrS0t0NUFvTzN4QnhwZ1Z1M1RsTmpYN0F2RWxTbk4rVm5IQXpL?=
 =?utf-8?B?QlliSEJkLzJ6SE9XODUreDBOdGl2cG9idFhuZTRGa0R6Um1HN3prNzg1OXVM?=
 =?utf-8?B?VC9KOG1iQUR0VmtUdjUxZnY3blBhdWd3bXpvNmgxRUZXVDdGc2hNRnJ6Nnlx?=
 =?utf-8?B?Ry9DdzdQZVJ2TEpwbWJWaEVraUZ0RERIbGcvaEY1cUdpamp2eEtwaTdxQWJr?=
 =?utf-8?B?QktBb3Iyc0ljL0VRMTE5UFJOSE4rNzd3UTh4b0lnakN0Uy9tWDlkUXlsZjZR?=
 =?utf-8?Q?+OaRkjL7pX40JlR0=3D?=
X-Exchange-RoutingPolicyChecked: jfxK3w1/JDs06EedMe8AG6pjzTzpsa6W9IfJxh+huDP3BkQkdx5f7ZiHob06ymEX40aTsxkdbUZAbzjy+eS7zcVJMdA5/GacIRjbhfU93qnuwKJswyU32Pr0PKXOB1jK4qrwxfIyV1TRni/nADdncLbUMsYfbxKJm8aYeJ3/mt/Ex/88Gg0k6xcyeexr3a84YD5HG9x9v3g7oPSR3kY2ONMP8NboBnqFMgH9kesU0s8Xez7lWTllidzy0VpZcvH5cGyP1qGdtlU8pSpR+6m/FkXKmcCtMe2b+OnawioKLKt98I3+HQR1sOeSHSwU9wWGMwg3NVLdCw4F4+RCzHmR4A==
X-MS-Exchange-CrossTenant-Network-Message-Id: 8268b275-c6af-412e-0863-08ded3643eaa
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2026 09:21:03.6459 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VJx/Vklbrd+FxLZx3ys8UNYzVgdi+7Ogh+rEeE00TXsVNAP78VN9SnhO+Pz5ETJNGRS0Z2aRuDw8GYJj8CWQaA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8837
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

On Wed, Jun 24, 2026 at 01:14:20PM +0200, Michał Winiarski wrote:
> The q->replay_state is blindly overwritten, which can potentially leak
> memory that was previously allocated by vmemdup_user().
> Return an error if q->replay_state is not empty.
> 
> Discovered using AI-assisted static analysis confirmed by Intel Product
> Security.
> 
> Reported-by: Martin Hodo <martin.hodo@intel.com>
> Fixes: 1026c1a73a96 ("drm/xe: Implement DRM_XE_EXEC_QUEUE_SET_HANG_REPLAY_STATE")
> Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>

Rrviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_exec_queue.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
> index 1b5ca3ce578a4..663decb19304d 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> @@ -805,6 +805,9 @@ static int exec_queue_set_hang_replay_state(struct xe_device *xe,
>  	u64 __user *address = u64_to_user_ptr(value);
>  	void *ptr;
>  
> +	if (q->replay_state)
> +		return -EINVAL;
> +
>  	ptr = vmemdup_user(address, size);
>  	if (XE_IOCTL_DBG(xe, IS_ERR(ptr)))
>  		return PTR_ERR(ptr);
> -- 
> 2.54.0
> 
