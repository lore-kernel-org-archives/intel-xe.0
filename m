Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61C6AEE3686
	for <intel-xe@archiver.kernel.org>; Thu, 12 Feb 2026 14:03:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2167510E756;
	Thu, 12 Feb 2026 14:03:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mL0L4y5T";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F0C410E754
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Feb 2026 14:03:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770904981; x=1802440981;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=FLE0Bd6fF+GiUNwGD79xB6wHsnhmGgw3NCVibTG3Y7U=;
 b=mL0L4y5Td1n/fF4EDovWnHxFDxMnKC5GSpfwzqg/Uz7W0nbuUdkgYmjv
 unM91dRtrSuViCfk7MX15mSAEJ4tLhpL+nKs+dGuptHJ9cJdDu2IMCFpX
 kzmdHcfeHa85z3+QTfY9CvYAoVDwVVvRrHRHBiZf3ebel4RYZhL8PAg6T
 WR2RHWcBjeHhCD1T+IupV7bv9EABE3iSqS8X+UQuOk0mKcStAbDsuqCmP
 yfo3gLM8JZ2seoo01C7CdQdbfRr6JeKDG4NuoSq+d6RB3QWYWbJKVSCRa
 /mXFXurrPHDUpMKLNZnl3on6zoyAhlPaG8ouKJ5fUEmcizux8IhDAZ2lp A==;
X-CSE-ConnectionGUID: BHk9aKZ2Q4KEX+vEmfuaiw==
X-CSE-MsgGUID: YD/di7pRQ6mFvByZTIwkzA==
X-IronPort-AV: E=McAfee;i="6800,10657,11699"; a="71970277"
X-IronPort-AV: E=Sophos;i="6.21,286,1763452800"; d="scan'208";a="71970277"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2026 06:03:00 -0800
X-CSE-ConnectionGUID: OwTQstTTTVW5/QNpd546Tg==
X-CSE-MsgGUID: 1ImrZ3lYQriDDvApZoPF/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,286,1763452800"; d="scan'208";a="242190035"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2026 06:02:59 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 12 Feb 2026 06:02:58 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Thu, 12 Feb 2026 06:02:58 -0800
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.25) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 12 Feb 2026 06:02:11 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OmPAaFDRZcuXZ/ASWgWTOZ3o1faMpvx5bM8kldwMl3XNPLuaHWc7dkALBJFC68zuNNF/MWKpWPCPrgjrue7/0Xty0xWITcoHKaSUjl4luiYPyMIMa0r2VlMnIwA3DbZtijvqE4I9ONzRH6JKVQWW6UgEqWjvK8gnRHZk+9RqAUjvg8Ee21hG/G/rfoTxxGMmKBMSynDr7i3cr3p7z/IPk9O8KpMHUqyaQdXfT8PdGAasiSz++bRrI/S9yHGUCIX4//s6jvzz+BwOf33vJm1s/9fcAIqScHqoyusiSpXLE2M4+QYb9s4mYT3efJXaW0oViGZZlyoIRr4G1x2sVjIV3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IMZGqsUo1JP+iQRAhgUnZiRhejFD0F8uzvs1jcenOpk=;
 b=jUWDjspDcA0kpOfGmJUjzgFo4kFpyp7nrlnZ/PmL/OGpyXgXZ1d6OmugyMufgpK3jEYpTbQuJ0VQ8wlL0J67HIqNMzTw9EmD8SV2k0YCVJCslK6ozpmkGstEyAd7X+l9J/2Iwt5QR+qcsknMXozeQCyjoXFU4+4PfdtxXh42dnLk91ab0KLkI0v/am+ji/eiNMGYst3ipivE0cqA3v0LH4ha7FZb3pWpT3zzXQOP/tiMdj94f8VA3hT5dkZZi6MKjLYxWfqrg/5yqcX5WnheQPLVARvrJ1ixTE6Ug/wyPMcDAqqjbqFb2Oxa8kMvhydt0ZgBjQWBmV8QB4v4v7n0dQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by BN9PR11MB5307.namprd11.prod.outlook.com (2603:10b6:408:118::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.12; Thu, 12 Feb
 2026 14:02:03 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::1d86:a34:519a:3b0d]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::1d86:a34:519a:3b0d%5]) with mapi id 15.20.9611.008; Thu, 12 Feb 2026
 14:02:02 +0000
Date: Thu, 12 Feb 2026 09:01:58 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Raag Jadav <raag.jadav@intel.com>, Christian =?iso-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>
CC: <intel-xe@lists.freedesktop.org>, <matthew.brost@intel.com>,
 <riana.tauro@intel.com>, <michal.wajdeczko@intel.com>,
 <matthew.d.roper@intel.com>, <lukasz.laguna@intel.com>
Subject: Re: [PATCH v1] drm/xe: Send unknown recovery method for
 XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET
Message-ID: <aY3dVn4pSgw-wNZD@intel.com>
References: <20260205111836.1628965-1-raag.jadav@intel.com>
 <aYUfpZOEIHl3i_kf@intel.com> <aYWK6DK4F7qIhsok@black.igk.intel.com>
 <aYzAYqWrDkuS1Ro2@intel.com> <aY1lApm0_ZDMoyK5@black.igk.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aY1lApm0_ZDMoyK5@black.igk.intel.com>
X-ClientProxiedBy: BYAPR06CA0037.namprd06.prod.outlook.com
 (2603:10b6:a03:14b::14) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|BN9PR11MB5307:EE_
X-MS-Office365-Filtering-Correlation-Id: 4928a29f-4a49-4bba-7a74-08de6a3f4c2a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?vTIIjywg22LFM28Cc1ZYi6XjgNEeDSCcHLQjvcI6gOUMaAteTxNCV7Qjmd?=
 =?iso-8859-1?Q?iqnqZYuZUKO2u7wEyVxxUR2b4m68Fk8ZP+UYrU3OfOUL0FB1T3eOxSPDop?=
 =?iso-8859-1?Q?dZrBY39Pc0D37H/y3MRpSqA14bFVjRqHR19xoCOnhpLFghPRlT37+bHuj8?=
 =?iso-8859-1?Q?CP3jLbZUnqwGiMPziMdHDrEWviwp1vDQKXrjjaYv0GyscwdSH6Gt/DyUaM?=
 =?iso-8859-1?Q?jI/1raxhP9xKaGIbQAfZHko562MyZl2F2ILhASjdDFvKmztroLS9JRQmU2?=
 =?iso-8859-1?Q?9LsZHfOSLQ0t4PMaja1nMIvfCl1tjgd06BUqkTUEE9g/KNZQeep6JAO9ye?=
 =?iso-8859-1?Q?9RZgKSfcaswovmSZydUlB4UblBtiy3osIiKuRn+O8/BSFjr62BahX2ukUe?=
 =?iso-8859-1?Q?mPm3FdeYVDkRSVDqPdCCY0d65ZP3LOPuLOVQk466RkjfXXyyl0LQNNzK2l?=
 =?iso-8859-1?Q?Db5d8qIQq02/vM2nBvaPwf3XXIChs4BuV2u5omeyWa1+3LN+IO5SHYYE0q?=
 =?iso-8859-1?Q?blYyyws7FOiMJKKGjY9DsZb9q0Kzy1nhsN9R11E6fCYAF0Y3aQaN/R1v5q?=
 =?iso-8859-1?Q?YHXoV7cjtJQpugUyjB4kf0Obinbl7uFEj/6SjTpZTYdedNkx5x4rm2SipL?=
 =?iso-8859-1?Q?phOxUeCylz+UNhoqyxgy0Qs5Bru6y3gkfgPlNiT74x1dnHYkGpzf3RvlL6?=
 =?iso-8859-1?Q?wjx5s6fghmcvSa5gykSJ8gZncJMykg7hQeE+Nbm/dkydVmlwKvgH9Ed71x?=
 =?iso-8859-1?Q?8h7VNvQcO/BEnuNLnv6Ch3cCa/68dtA80YvwGtKnBaZhUzBPFGu6kP8Z2F?=
 =?iso-8859-1?Q?l0CyvxWxYp5sdBJrxDDVgmcFOPXEcmO5otS7nRIE/+WjII8Y2OD3sfVWzh?=
 =?iso-8859-1?Q?0qSOzmLMAd/UfPJSaA0PeQCycLxgtLFUTPMWF5lUv2xwLfxg526G5wvGuv?=
 =?iso-8859-1?Q?xNVpGrRi7Y6ru0aTf8rgoE/EsKNM420oYlmFcyJ1Q0mImrr3n3o3JTI5tI?=
 =?iso-8859-1?Q?BXQD6Mh6/vP8gKIorU1zhBS2mqOBJ2+iWxCKf+s+BEAEQUt8pZThTgc4UY?=
 =?iso-8859-1?Q?4F0lo74sca0dztnfKgs86hKdqPoP3+fX0qHE8Lx/Dj/2tCbDdGTEy3Hdf5?=
 =?iso-8859-1?Q?j/mWm4+BjwohCmXd2ykW3GmGf2cIFBSi+BsX47P7QtIf9m+2bL0s8aKM9a?=
 =?iso-8859-1?Q?xJjAvTP+5tRCDLz0jaJ7budy73AB4jJUZie7nmofIfvVc61IwFrRffCZEV?=
 =?iso-8859-1?Q?/jfTLU+yE7d5SUbTNkUvstIUDYLGjxDX5EjIACFfXhwRvy6aDD88YhcKGc?=
 =?iso-8859-1?Q?0PkYAkpddEmcC7z3k050rCueMprbjSTb/rU04tYSby2c3s/CbbtXsnMQFA?=
 =?iso-8859-1?Q?/HANwkCsRrkfhTa7fYHjyIaNBnTDUkv4caaAJ71+auzCIkqioTB8mG3wyh?=
 =?iso-8859-1?Q?laImcFzOWrAjfffzpQU/v8twst1fxti5CcW1X0xDV4DXoldVoXYhaOXRGI?=
 =?iso-8859-1?Q?4ArPS3s//ZznxP281RIGHhwwm1A0Sk/fLllk5nnYX44RW4gsPAv/sZ1f0C?=
 =?iso-8859-1?Q?IfMT/F9gD8E8s6cwOb86Bsh23xge+rCGMn4KeJ/V5ghtKFzxIyC0sTANiy?=
 =?iso-8859-1?Q?9KB3bRmv8up0w=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?AwDvlyHi/5u3kR7WURlQqcoH5SWeoQz0ycyOfwIA3pcky7eKIe//xqTaCb?=
 =?iso-8859-1?Q?GuPiM93pX5UEh6iqBDlddufXzrKCXr6gWLHu7jeY3WHSZChQ9SSRc4QdBW?=
 =?iso-8859-1?Q?q45nZ1hFCNE6utdGZy896FvG2Wrbv57qWLsvAXyrYM413W5PP5EabKoKgs?=
 =?iso-8859-1?Q?LVTo266VfoWPu1va9uaq/GUyinXKS+hnnvy6wbk0HyxBI97acB5iABlCcD?=
 =?iso-8859-1?Q?ByVhECTBN4wjcqA+WWdwqo93A9VkPcbN3r4Pm1ZuGx58d1PiBJfLSTdgNN?=
 =?iso-8859-1?Q?zj/l/Q73jF4AmHIg2A1MklvBL3Z3hg+5osRBooWbMouaFjKOOvb3VCIejJ?=
 =?iso-8859-1?Q?7mRpjG+t3ZWy54Fem/IWWKtw66d5n4Ry6NjPlEJbRg9QuqD1gro506/AH9?=
 =?iso-8859-1?Q?Vz3BlW/9YRIPZVs1Vhj6e4znqjS5I9uo2l2FV/nTV705r+tAoCyqYeHixV?=
 =?iso-8859-1?Q?C9GMl5WBYZaDGZ4Jk1Fr3a9iEHrmmBpcNd/NgJDPQ7Mb71tsTnQJxghfm0?=
 =?iso-8859-1?Q?r2l8LOzXuPalw4DGaEG3WZSQ2EW1DpwBHibakrMCi0uqT3qLZ2Rd5D4hji?=
 =?iso-8859-1?Q?aJFBUFbVavkVlNbXwma4ILpHxVAUs9ARmTvNXRZkkEly1nDcorPZQAsXPT?=
 =?iso-8859-1?Q?2+33rNmblLgMBfI8n5zRZqdysF6kqQ4Y1/Mh5I86LRscrT3x8uZZ/NroEr?=
 =?iso-8859-1?Q?zKBw90G6D5g56WlJrQsx6przWVrIwe4Vw160bUZSZQesMcnR3qskFqa57+?=
 =?iso-8859-1?Q?JwsbUdyd/dua/DqMwgH/bNnqIjwTszVChhkcyIJbLLfwvbgAXNVm1AxFWi?=
 =?iso-8859-1?Q?rqetS0ecYN9mNwa2kSEKJjJlpgCh/1vSLKq4lTyPeJOIab8nPKlPfC/u5e?=
 =?iso-8859-1?Q?I4aJ8VgKO6IPEoKiClCdU5BHjCrkkfQ0g3yQEblTrdXuLZRdyw5Nnw80h0?=
 =?iso-8859-1?Q?iuz+nQNpvLvI6xUx6j2Za8FRkMrmNTLiLVUjvJ0mjpzEYZZUjH+K83lOf+?=
 =?iso-8859-1?Q?7P+0zTch1VsikbMaut3x+yXJxkvmWanxfwORb9StjnoGNoWlzl0HUE6ZqX?=
 =?iso-8859-1?Q?gxz3zyL2wFFBQ3vt43z5l9/lJR3c6mzHUkrGZSbpjkynLCwEskChLD/POq?=
 =?iso-8859-1?Q?Dtl2/6PL0wzQ92qvvqoW7xpPI3Y8s/EKL8Meh+VmqBAEaGU0R1Gyzk6UWb?=
 =?iso-8859-1?Q?cY3sb916K+yvQ7kigMmpiRBGBGtgvopZ6WLiEJuWdxxZNqFDMSuvewF9lr?=
 =?iso-8859-1?Q?2ju23DKDdMEZ26quoHeu+Z/cAQeEySg5O0g/Ekl6lR6SUIfblr8GGv9RD1?=
 =?iso-8859-1?Q?+auVI6zybLs/LVXaJwT9x7LOiJ0tYIaQtbCf//ODqdj33mAPuPpzNgdZfP?=
 =?iso-8859-1?Q?kdAsnaKRrnm7tSUOY7A+8TdxRNYL4RCtlqF0A46FFgD9DGBj7qNQ6FLYJ7?=
 =?iso-8859-1?Q?pJnpfSJyLlKfjeY1ACl0E09fdFWKf5JeMOiZzcEenW2chsYhu3tEhXQ/pB?=
 =?iso-8859-1?Q?9+bkO2JJETOZhpeq43P7UVe8t80fXdl7WtzcBjrC6oSqVUkHJXq310G4GX?=
 =?iso-8859-1?Q?0BDpGmGV5YvZdnpHVzt4KrQm1YzGQ97cv/ZxT2yDrTFLANNnlgJ/CsLiiw?=
 =?iso-8859-1?Q?Eao5s6s3BuXHtgbxk/paiVqx8u45tbwJgsRgoCS9cKK+Zjj1eMvk+U1NXD?=
 =?iso-8859-1?Q?atdxbSCeQddu1F0IZkmYB0HKH+nKCJnyYrMFKd/BP29UqrXsAb5Hy6zauP?=
 =?iso-8859-1?Q?wQXB4fRokpMkiS8SJl/wo6HA/SJL1rDcZRXD0RWc+Rv0Mc5mLGRFwNlbCG?=
 =?iso-8859-1?Q?2zcA53OcqA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4928a29f-4a49-4bba-7a74-08de6a3f4c2a
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2026 14:02:02.8937 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2Uv7pCuQQlhW/VIai7RDU5GUN/SnJNInWyAtCO6TrnwlzIijtQYVyQIYdl5zyTlnn3GX/p+ZQbrLv6vQsfdjFQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5307
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

On Thu, Feb 12, 2026 at 06:28:34AM +0100, Raag Jadav wrote:
> On Wed, Feb 11, 2026 at 12:46:10PM -0500, Rodrigo Vivi wrote:
> > On Fri, Feb 06, 2026 at 07:32:08AM +0100, Raag Jadav wrote:
> > > On Thu, Feb 05, 2026 at 05:54:29PM -0500, Rodrigo Vivi wrote:
> > > > On Thu, Feb 05, 2026 at 04:48:35PM +0530, Raag Jadav wrote:
> > > > > XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET is intended for debugging hangs,
> > > > > so wedge the device without any recovery method (unknown) and have it
> > > > > available to the user for debugging.
> > > > > 
> > > > > Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> > > > > ---
> > > > >  drivers/gpu/drm/xe/xe_device.c | 9 ++++++++-
> > > > >  1 file changed, 8 insertions(+), 1 deletion(-)
> > > > > 
> > > > > diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> > > > > index b1241fa4c3d6..815f0b0c9dfd 100644
> > > > > --- a/drivers/gpu/drm/xe/xe_device.c
> > > > > +++ b/drivers/gpu/drm/xe/xe_device.c
> > > > > @@ -1326,8 +1326,15 @@ void xe_device_declare_wedged(struct xe_device *xe)
> > > > >  		xe_gt_declare_wedged(gt);
> > > > >  
> > > > >  	if (xe_device_wedged(xe)) {
> > > > > +		/*
> > > > > +		 * XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET is intended for debugging hangs,
> > > > > +		 * so wedge the device without any recovery method and have it available
> > > > > +		 * to the user for debugging.
> > > > 
> > > > agree....
> > > > 
> > > > > +		 */
> > > > > +		if (xe->wedged.mode == XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET)
> > > > > +			xe_device_set_wedged_method(xe, 0);
> > > > 
> > > > but why not using the already defined:
> > > > 
> > > > #define DRM_WEDGE_RECOVERY_NONE    BIT(0)  /* optional telemetry collection */
> > > 
> > > We originally added this for AMD usecase, and it doesn't strictly speaking
> > > means 'wedged'.
> > > 
> > > Documentation/gpu/drm-uapi.rst +441
> > > 
> > > "The only exception to this is ``WEDGED=none``, which signifies that the device
> > > was temporarily 'wedged' at some point but was recovered from driver context
> > > using device specific methods like reset."
> > 
> > Well, so, why not to change that to a more generic meaning then?!
> > 
> > 'none' should mean, no recovery help is needed. go away user space.
> > regardless if it is temporary or permanent...
> 
> A few things,
> 
> 1. I'm doubtful if Christian will allow it since they've built a lot of
> infrastruction around it.

there's only way to know that...

Cc: Christian König <christian.koenig@amd.com>

> 
> 2. "Debugging" != "go away userspace" IMO since we ultimately do need the
> recovery, it just won't be automated.

exactly in my view: 'none' = 'no automation needed'

much easier and meaningfully aligned than 'unkown'

> 
> 3. I had debug cases in mind at the time and have already kept a provision
> for them.
> 
> Documentation/gpu/drm-uapi.rst +533
> 
> "Consumers can also choose to have the device available for debugging or
> telemetry collection and base their recovery decision on the findings.
> This is useful especially when the driver is unsure about recovery or
> method is unknown."

Okay, so perhaps we need to update that. Because in my view, driver knows
and it is pretty sure that no automated recover should take place in this
case.

> 
> Raag
> 
> > > > >  		/* If no wedge recovery method is set, use default */
> > > > > -		if (!xe->wedged.method)
> > > > > +		else if (!xe->wedged.method)
> > > > >  			xe_device_set_wedged_method(xe, DRM_WEDGE_RECOVERY_REBIND |
> > > > >  						    DRM_WEDGE_RECOVERY_BUS_RESET);
> > > > >  
> > > > > -- 
> > > > > 2.43.0
> > > > > 
