Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6407BCCF9EE
	for <intel-xe@archiver.kernel.org>; Wed, 29 Oct 2025 20:32:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E7FA10E159;
	Wed, 29 Oct 2025 20:32:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="C908RbAE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 419C610E159
 for <intel-xe@lists.freedesktop.org>; Wed, 29 Oct 2025 20:32:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761769963; x=1793305963;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Yn9k/cvtKEJM0d7ZzWCEZneRoIv52Ngqn5vbQyWhsps=;
 b=C908RbAE8tkC1xWo/dKX2bg+corm22FE5IzlusbsZDHxKNSVAW7LqU7O
 S1sskl/oPygyFBwHdxtBtNkPQT6QU1QhjkHB9gwMc7ad5+Fza2p4vZmpS
 Vt9L0WOMGtnR09cT6/ro1Ae6E6Pc3VaC5JXAnWku/kpXMjHBioOeeTt3o
 PQDZaepJE71CekQO1dSLX9xyJtI4gA98EST3xTEd1O42haOZZhMcHDuKq
 +2hnn03tzQ5wYfLdZ0AIHuhnq9yGEUz2Oo+ctjbL7kBIkxQkeZ6zmXpBw
 lCt5u4v8E4Vf9XuiSkwfAh8+H2qjqiCLFkxK5BIdfYQL95kNym6MN+Chf A==;
X-CSE-ConnectionGUID: fKaKuzvsR8GbI0IWrqr5BA==
X-CSE-MsgGUID: /2KwbOY6TguS5uztCeNe1g==
X-IronPort-AV: E=McAfee;i="6800,10657,11597"; a="63787362"
X-IronPort-AV: E=Sophos;i="6.19,264,1754982000"; d="scan'208";a="63787362"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2025 13:32:42 -0700
X-CSE-ConnectionGUID: uy8ZzusUSk6JR9EH648LOg==
X-CSE-MsgGUID: hW2L2qLoTGu3a3XJuvGLQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,264,1754982000"; d="scan'208";a="186508906"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2025 13:32:41 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 29 Oct 2025 13:32:41 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 29 Oct 2025 13:32:41 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.41) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 29 Oct 2025 13:32:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nzLvqKHBEMUVRndbwhd++FnObfUWhdpvamqWVuTCqEY97LyLzR9THWyHEll0+/boDqe3roxsMWaT0ORBLQqSbBy8dkAmziAM65qaZmXuHoT4ifOWHeBchCC+xjI2Lr9kGQpsl+EEkY1jiHcnj1dh2RAze4/dzPxfdDF2pEfJFYnpk2qOPrwv/uW6F8+Yoc3vHuD/UzFwOTcBlft5cJMjNvE3nmO7FtiLJHt6jWss7n/r6tOWdsayGudjY64dexAphqHfBUU9NxOEVbcbNqOJ9gvr31A+TnxHgsZ4SZLrt4u6R4WAfMHqbOAWcpfKDlG8ZAYbH12RDITzUI1IYAdLfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Yn9k/cvtKEJM0d7ZzWCEZneRoIv52Ngqn5vbQyWhsps=;
 b=cKeTKissEUsdRxPXUynnnbbHAHDeaVBX7dJsG1ijQh+IGY+T4Aa0m5GRIwE32yNyAxHoA9Z2UBS+LmQ97PyuVE8bknLjN4UEmvImBxlNzez30GKCpDbloLCNffHgAF+xrOIXqHFGD/Tbsw5AUbxpYIIXVgo+9Ag7eK0SKnBXQsYCpl7DJMIMQxR2MRwTLZ3spI+wEAVgH9/qNeu2/Y+tQvMV7IfuGPaxIa0T97Ve4i3cSaw/oqTC5EiRDqiV/NtdAF/ozZCQcOkS/KZgx4GS7eNcnS3vTRthO/HJSLKGDtaKp84wY211vUXFGzWB5jTmOJv0ymBaidVANAT7cKfT2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SA0PR11MB4670.namprd11.prod.outlook.com (2603:10b6:806:9a::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.17; Wed, 29 Oct
 2025 20:32:39 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.9275.011; Wed, 29 Oct 2025
 20:32:39 +0000
Date: Wed, 29 Oct 2025 15:32:37 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2 08/17] drm/xe/pf: Add functions to bulk configure
 EQ/PT on GT
Message-ID: <wzyrbi7fxzhxapvdxncs7q7pepgespgxaaaeoqtxvuklvswpvn@zhrf6hkdskxt>
References: <20251028175832.184534-1-michal.wajdeczko@intel.com>
 <20251028175832.184534-9-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20251028175832.184534-9-michal.wajdeczko@intel.com>
X-ClientProxiedBy: BYAPR04CA0013.namprd04.prod.outlook.com
 (2603:10b6:a03:40::26) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SA0PR11MB4670:EE_
X-MS-Office365-Filtering-Correlation-Id: a2f8e09a-66a1-443d-9d7c-08de172a4da4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?MsjfBOHuvQYsPzYluaIjnh6BCf6I6gQUCoxUsOklAPLS6ExwHC0Ze+EfwRNI?=
 =?us-ascii?Q?tvWOR1KK/ufKsdMJZxhNidUVAaBt9Jjgr7HQZqZoQeBh4anDyw45xKulZDNa?=
 =?us-ascii?Q?kvf/ta3Xn+iYbndk3WCeVelE7wPkwJVfgjp+JiOVWEn3KorszySCLvqqGmkh?=
 =?us-ascii?Q?Brlw13rayNPkfBpyBPfOsKmIlnSsm/dvosbzCUbDv6uiemlFpgSuxMT28ugK?=
 =?us-ascii?Q?nKoXXgBFWypfqn6brk7XbWe71FD4NLHxhIwAOUNz1v23RTO3WWWxdCpgJzZa?=
 =?us-ascii?Q?ibkkJMi6WtB2XP/OyBEHoPj9LjOPmYalVfH0nhpnklYTyOu5baL6XzFVBErY?=
 =?us-ascii?Q?ii9rUE4PXZtEv9MFDn9nWDpQWyJ4JFrusc9EOWQY1aqaJiottTtI67XT+OCa?=
 =?us-ascii?Q?xE9dsC1t9DNjlZbloKIHv9K4OxGif0rdIO760UOEtw8h58twrcDQJHCvzDmF?=
 =?us-ascii?Q?s4S3Nr5nGsnU0hhuPuhPL9IXTZzBxxhPaab6Rbz3MlpCgXHDt2Urvm298FsR?=
 =?us-ascii?Q?tyTegwDPeI1uwesCfKt+jxfkfI0ObCfynFjip69RCoOAmgqIAd1nBhr6aQrA?=
 =?us-ascii?Q?Sly4Rwbku2WK6I7Ord8gnWbt332VpPsGTPmanCBfmuWUT5IDcPPZR3esL/0Z?=
 =?us-ascii?Q?F4MZWZfoCgsh9EAFKPEADhgrGTD6jyjQ1PZSuQeF6U4shM3OF6j1r5WMi3Rq?=
 =?us-ascii?Q?ztdsiy4ztD6wJlX3BsXcICbH1JT8geXwtQQR2ZU61/oGUEsN7w2Gps2LhJjC?=
 =?us-ascii?Q?wCTlftcmIK74LtY8rjPARCV5tVMnHBmnNp7CRty3VCi5atURel+hw7ogNiBY?=
 =?us-ascii?Q?jfQGqo6Y0UadtzMXv7RoHJFJ8GpdN2m1uM/ZQ5H/xlN5+tyXdGYiIuFu+ati?=
 =?us-ascii?Q?jMEUuAjfrltWVxzJmiVl6cF9gxhtJHfP8yUxgwqBM2H2fQPG5N84O1e/J0jQ?=
 =?us-ascii?Q?bTnKcfhDP+Fir5HUZVF8Jzzfx4baOUmo1hXUEaAcZybhv9hss1uW6Hl4QyCy?=
 =?us-ascii?Q?Km9xNNNha8IersNwaJA5LuuLMUewyJV7bUtiI4Jbgk+BAD7NdhaPCdkKrJB8?=
 =?us-ascii?Q?i6dzxQ3yffPv3mZrS/OFYymfUB7ce/FlrddidtZa4W5VVwpb4C/M06bERa8p?=
 =?us-ascii?Q?04lcKqk9ZNYHgpZ8j4i9WLhE1FktCyLkvySACpeWRAmHa8FO/dM49C7ky0KN?=
 =?us-ascii?Q?FKP1Hv6GieoP3xKhA64+yBQed++wSH+MG6gaZ55C+TNoOmo1J3HDNLbY85to?=
 =?us-ascii?Q?/9i8gk36Ha36qonaCp/b7n2juNL86AmdC6xquobmeZ+dknHFDNaT1K2AmcV2?=
 =?us-ascii?Q?sSbzOKmHpPz6lP/NwmG/lpDONVIqF6NyNQgj8ggqjM0GXtIThq/mCTlQi4B3?=
 =?us-ascii?Q?S32KbcwPMjwB6PPGCtbU9zaxKTUn3wF1JWzk3GeEmrtHSEWOk/KHc9JKtjol?=
 =?us-ascii?Q?s3O5xHLI1IVWUU0bAbN8vqMHmAYPPE76?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?hOeTq9BPKn5HVIgn2mc/kcKHujic/9VCV0bniiyXjJ6U2M3RFG3x42i6tN1N?=
 =?us-ascii?Q?va4uxUw6B6rt3qL5Wdp6U9D3aCEhwpxGuteASa8EPrMXe4GMO0t7M3Rkg3Gi?=
 =?us-ascii?Q?I0LoLmWcEy+Nh1kNFyUtTp5fcs7O2jHrGZ9VL2yQ59aYS9gv06b26zJIeyJs?=
 =?us-ascii?Q?DeJoRbkDekfmU4uCp2v0nVBrO3MaSb+McGIvEXrNjUA4rjp+wJN7b3g8rXLj?=
 =?us-ascii?Q?H7nB24gspWrE3RHnRabzsZIcJDJPC/oYNmbo0GimGboZZdK7odGNoMMEMuk7?=
 =?us-ascii?Q?H6cjfjrYojWUL23aTIuUbsXyFbDXljZX98rPOz+EZy/lML6Nc2TMPQJGDNao?=
 =?us-ascii?Q?usIXsTdIGXbgE9Q6VF7dDHm61Tg/3KE5OgYfLS3kQE+y1c8ERz9mmsZW15D5?=
 =?us-ascii?Q?4ZsQUSxtIuEfgPdp+ePg+sGF8NOSMLWa3jzc/w6jqOKKYn86qMtPg/Yx6yMW?=
 =?us-ascii?Q?8c4V/YV6ty0uCQeOgLitZEzj2E9VIMjKuqCKn4CgEOlJ0BsPXQITIYQOKPux?=
 =?us-ascii?Q?AsfqPSkjIu3SijZDBLIzbrvdNvQ3s5R2jFM+p1nc9fnuFBzhMGOkBXv8qzoQ?=
 =?us-ascii?Q?6KkrXnE6rL5SUh+ZO7aiTSbs/a9l6dgBE5Sohfv8U66Y3yHawIXEBPaeD7VF?=
 =?us-ascii?Q?0joWx/9uoKwdBsA04AYN+KutCDuL+Y1PJgxE9Nep9xB2d0/q1ygmpXagtFyO?=
 =?us-ascii?Q?mB8NXbkM0S+2r/GG2p2IPreW4lxLcMCItIpWEfwIZ4XdFEXSpViSYkC3kpQk?=
 =?us-ascii?Q?EG3LgeSZUNuY/LoOMjKXjuUMdgRr7e/Z0IvYMj06rwZZIJ/FiTZ4aBLryLoG?=
 =?us-ascii?Q?MgMPoVcBjBIPJ3qY61tMoPDcxJnUMdji3fhOJ886L6sWJb0Jn35Q3B3xYCKF?=
 =?us-ascii?Q?P4APS6vKq0/xRMUgROWQZ8idx9O8EjpHCivVcet5d2vfOxCBDlkRms4/mp2D?=
 =?us-ascii?Q?n4bE7mqetwouTqzR82u2pkhinmfr6XsB4GK9riZHUo9TJtAlxBsLIn7K/Xuw?=
 =?us-ascii?Q?get1S9fUOlly5MwcJDUGtcN6EX9lu7tz6ggT/DdvDTH6N0wmo3zlDhJphhUw?=
 =?us-ascii?Q?DdZ9/l+CztZXajYSA4PMMEVpIGS2HAy0kEDrXKfo2FNoZJzUceNYPZBdwocP?=
 =?us-ascii?Q?CCLsfLt/3CrTKtizUUawDeY7fqQB+476hUJl5MSY3uxprxRLXNt6tFo9DwW/?=
 =?us-ascii?Q?CHmYldnZjTuXoQu6n6N6RMjHVqy/fv2+MdzSzCw7ef0QdylqhLzneOZpH6GW?=
 =?us-ascii?Q?+lq7iX/4eEuOir0Xg56J2IPNz26+zsTNygHrKkviUsSvRv0qoBEH0uW3PHJ7?=
 =?us-ascii?Q?vOKnArj1BkJvaDsuBtg4C1Ljw33tsZ07PS8hoabdy2o3Eiq+5NLG4p3Tt5Wt?=
 =?us-ascii?Q?0UKDo6Kmr4LwxXFzQjwoU0NyjvfXZeioEMZQrbJPz6V38s016BeUTY6xNn3h?=
 =?us-ascii?Q?k1f3rn45NsO7GGEPScDDh0b1fnijsuS1mi/99aYDZ69nXDgDqQOK+9sD/EOo?=
 =?us-ascii?Q?oXSJhWYAbCuP0F3kB5Klw7yGrioMDZygwNHGWwR0IUieIf/ffY50050wUCd1?=
 =?us-ascii?Q?n0aHoGCzIn/A2MTC7roh5JOmNWfCaiTI5EhjeS+6XufxmMSSbu+bZsXJ+wiD?=
 =?us-ascii?Q?hg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a2f8e09a-66a1-443d-9d7c-08de172a4da4
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2025 20:32:39.3503 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AEJnelthqIBqF2W0c36qnBi7ulqEAp1iejP2CSUb6AkUJTFW04GI9uCcH3zzDnc44SEn1WaWLwFiklOBPU4+2roY+o7wZksd/IGdl0rWK+o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4670
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

On Tue, Oct 28, 2025 at 06:58:22PM +0100, Michal Wajdeczko wrote:
>We already have functions to bulk configure 'hard' resources like
>GGTT, LMEM or GuC context/doorbells IDs. Now add functions for the
>'soft' scheduling parameters, as we will need them soon in the
>upcoming patches.
>
>Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi
