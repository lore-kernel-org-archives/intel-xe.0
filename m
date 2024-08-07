Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02DADC3DA7F
	for <intel-xe@archiver.kernel.org>; Wed,  7 Aug 2024 13:59:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A69BF10E528;
	Wed,  7 Aug 2024 13:59:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JM+4Mwt8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6729310E528
 for <intel-xe@lists.freedesktop.org>; Wed,  7 Aug 2024 13:59:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723039184; x=1754575184;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=p+z/fOy+CwkN71PMrL0/fk6IWE5jG1hBimh1Tgt5cN4=;
 b=JM+4Mwt8y7e9HyUycxddR64Mxdhq9OtY4yDlbbruOJje1Fn7eDN/t9LI
 /bHG4xJamE7GkNgSCDYPxFstkZvlYjomrsP39oBpoceyVYzys/LY9xQgE
 YYe4wvW+EeLn3D5M0pNyt7osI67Y3SbzbQS4XsuEbVEdCaX5gswbELWHe
 dhSzVMt375dsDYZnx/ew19frGiJ4M7EIIbbkzXstQBXeGuhrrejjY95XQ
 +ymMah4Pp6xe/YkpaXRYS9trXxoOQ2qVfrlFGY+d8ZiWkRIlTAb0zEl8n
 UgNCNAyM48gjISuVm241LJxBVBq/a67BoxcmTjv33/4l5noZoAJtKEg6G Q==;
X-CSE-ConnectionGUID: F+MgeMjcS1yTxXru9Dkmqg==
X-CSE-MsgGUID: qRVLHgogQS2AkyZYnV9xEQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11157"; a="20987428"
X-IronPort-AV: E=Sophos;i="6.09,270,1716274800"; d="scan'208";a="20987428"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2024 06:59:43 -0700
X-CSE-ConnectionGUID: bbUQ+KAHRPuQ591bVhya2g==
X-CSE-MsgGUID: LFsigNngTp2QEpsMaalH3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,270,1716274800"; d="scan'208";a="56526562"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Aug 2024 06:59:43 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 7 Aug 2024 06:59:42 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 7 Aug 2024 06:59:42 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 7 Aug 2024 06:59:42 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.48) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 7 Aug 2024 06:59:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jxb57uu+itJS5FEVrBgQHwobPcgh9ZLCzkEUxKTblmO0gSpHrYrd256dM0sKEdTnEbK6/Hf4KB255V/KjnAy5KwCVPQ7ZO1gDPE1Ao75kMjclVwb7OuvaV74FfEh4oE+kFklBzRR0r1t6CaFHsBS46C4lHe18nopx6rFJkNQT/ZmyCHnTTYkYHU5kvkXo2dAz7KE3EfJ8T0qXDoGxaJ8n1DeJnnUAtaB5RaTdIusBzuLocGrsuKH4ns+4Yz+tdpYgWZA3pylexMRvQhNU9lwLY4Dvn82Q//ykECIbbZRoNbY4pjNrd/5UaLDY9lbrs1PdjkbmrMiNnjhdqyNkpmFyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ikhL8uITPKWis6v0sFKaLhNWf1xTYqPGxz3qGIN1/58=;
 b=R31XVRpP4qB317TATkh1WpgBarGt9T18OU8JWYdb9xr1tMoJvUzm3BZhVxOyjPZCaBTT0qfNkjSGqjbLlnwpEa5VeGPDX5V/5Ir9i+f4VUC0nFwLG4jvuPh35sG+0Z2nUBDorIueQMS36zzspz6n0ntBSrYP4Xqlhl7AacFjxMzyPC4mLuVTkWljxbMJKyKWv9UaBH2orm1IBikO3iqJWV++e/IdECAxqypyQOas6HkNqTg0sF8FDaoDLlAJsXfkGNdl7HbUutB83jL20laZwM6fthQJjIYZ264G82AhcPkuIV1TqlSFJR7f7nwPkpr7g8sCbQli3c9XrXkB1VjW8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CYYPR11MB8330.namprd11.prod.outlook.com (2603:10b6:930:b8::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.26; Wed, 7 Aug
 2024 13:59:39 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%7]) with mapi id 15.20.7828.023; Wed, 7 Aug 2024
 13:59:39 +0000
Date: Wed, 7 Aug 2024 08:59:34 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Nirmoy Das <nirmoy.das@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Matthew Brost <matthew.brost@intel.com>, 
 Michal Wajdeczko <michal.wajdeczko@intel.com>, Sai Gowtham Ch
 <sai.gowtham.ch@intel.com>
Subject: Re: [PATCH v2 1/2] drm/xe/gt: Add APIs for printing stats over debugfs
Message-ID: <gos5am5tdkhozpwidgopru33w33hgt5dd4wqcn4xkjkllkl6im@bkldffzsasvv>
References: <20240807110802.13385-1-nirmoy.das@intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240807110802.13385-1-nirmoy.das@intel.com>
X-ClientProxiedBy: MW2PR16CA0038.namprd16.prod.outlook.com
 (2603:10b6:907:1::15) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CYYPR11MB8330:EE_
X-MS-Office365-Filtering-Correlation-Id: 4744d224-8375-47c6-4fbc-08dcb6e92dba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|27256017;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?mkfNqu8UOKwMyDCrGLJDXHAAwfzzhtbtumcPMW+N+BD6O0a84A9XQTsiOk?=
 =?iso-8859-1?Q?i85BA8DiNPHZcPWzNUp0iKOOkOJChcafOVnrRi9Y1iQPb9KLemhGyQUru+?=
 =?iso-8859-1?Q?kFrVPQnxFDKYMZCJX8+PaJmSFnutqinRGXrM4aZ9AUdc2JbzMU/HiAovbJ?=
 =?iso-8859-1?Q?NQRj849PMW75j5q4C9Zgy3bAJfFn0yNiGlPEFRkoxFiNIl3oAYfW18akGu?=
 =?iso-8859-1?Q?8sST2PDdtIcCidw/JlBbUeZhrMEFlOcTSukelYf3deiL6J/WcuKGwmsWbV?=
 =?iso-8859-1?Q?563WzCt2s8Mf1yiBW2mIwGzFZXKbqCkKu/4Ta0iWwR9SCfItqt5uBuN58E?=
 =?iso-8859-1?Q?KGtO8ZBnkPFbNw5/ocrBw+mgUnWlJQbdwMZGc1JBwEK0HyQeLMhjlevLez?=
 =?iso-8859-1?Q?OJQ+ADRisvURxlMqkKszbII7QsSSmw04XsegHNHEefYJVBPO8k1C1/vkI6?=
 =?iso-8859-1?Q?8b6gKCpDnlR7cyXonqStUdf8w7qqnUIV6bXuJHju3qg0cSsO2SteNeLSfH?=
 =?iso-8859-1?Q?Y86VbYquITNsFErgI9c4FsP9iKF1Hypk8PYGNTi1aXa8roqCbHdRBCHgIq?=
 =?iso-8859-1?Q?zfmBqanfTgF2i1eljRTLip971hhh2R6CF80jG8h8ILDz2jiFNAFFM94WyC?=
 =?iso-8859-1?Q?GIymXbtkBbrSj/dvQTLXCE3AEQoPGFslzHO+NnsTAN7jZzZ8uKfjYdCdCU?=
 =?iso-8859-1?Q?MMrh3XuZeeHHp1GUtkbygn05awMnh+RRgRQeq0Jl0bkqnzwynEo4hv/k0A?=
 =?iso-8859-1?Q?sp4ImmOB+o6PqTW6DNDMyo+Meuv3uhB9RNC4KF8Awt5IqR5+2zXLxsXJHW?=
 =?iso-8859-1?Q?sW621PV8ftP9pF5/k+gJakbZt9bAcmUKrixQquq+KIupgwlXCNQJVFaENP?=
 =?iso-8859-1?Q?uxjkl6ftMZ1OteHo8gUqEE+BwYac8RCzYgO9yb3i11k/pSGFSMkAT3nvsf?=
 =?iso-8859-1?Q?5Fx0gZyNS5uwCB9xf1NBDG8u9gm02fN185nctqjRq4zyP9sYfWDZeNfN9t?=
 =?iso-8859-1?Q?8bHGn/MiB/0Kk80U1L/Z4aiPsoT0p3boJdn6+pepwIupJLlFPz8YndJKZo?=
 =?iso-8859-1?Q?QyyYHIFLqF8Ij3BnKMjsskTje9YO5VbnAsImiwM7vIz+EsUyruVRNNe0/7?=
 =?iso-8859-1?Q?xokBhjxIuYQ6GpW904Cc/PyBtbHPxaUb3djylVxpZV8INNqH1Jad6hSspx?=
 =?iso-8859-1?Q?Dc/ilIgHK2Ye/Y6PT5KcTKrJxBWIQmiFDyaezXiyTUe45WZdGu27gu9gQ8?=
 =?iso-8859-1?Q?kp76r4Yu71au0lmo6+gCdHAZhWeo9SFwk3dAdNtp/gUSMLOtSUmJvbVY4K?=
 =?iso-8859-1?Q?jMQAuXBjsZ982nHX4ktoW79eA8OsYJB1XeAESOCh4WadY8tBs80FuYx5bQ?=
 =?iso-8859-1?Q?Z+iY6lIc5b+v4fO+941lq2tzSBphygE/aMBu1vudkl0qa8Mkw6urTbZ2d3?=
 =?iso-8859-1?Q?iZTejth77Eogw0BrrDPDwwArFucCW+JTS92JVw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(27256017); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?Q0+bJT0fmeTNXie9eTthuYubBNq5m0V/B0gZLELz5ewJlLwrN20DoTN7oN?=
 =?iso-8859-1?Q?y5qZ4LlEO8ni8wyMdda8BGshcSL0CYYP5vselSlnTccLl3K6SxoOs8E9Ui?=
 =?iso-8859-1?Q?fDD1iwgpZe6Hq4FFNsqb94TcUb08FZ5O1q6MMyVEmUQZPg3GsvYRqW8WxA?=
 =?iso-8859-1?Q?qPdEY5xJ1gSX8+wIgFTY8EogyRPlEpAbZ3NU0t6hGKg2P4dPSgOuti0Gse?=
 =?iso-8859-1?Q?/zmNNrorBC+osd6UyR7RkEd3elAZ3gfU/URi5kufyaWftVhPD64bpYcV7G?=
 =?iso-8859-1?Q?S+r/D86VsrzDSOEdrPg877PNF3WBCUI8Kmv+/NICqvOqmxdnx3dF0pFBT4?=
 =?iso-8859-1?Q?rB+67ME322eDVuiQnWnfF52z41Id/C86JreqU4741tJs8C+XwPiL16cUi+?=
 =?iso-8859-1?Q?uFyUNUyBgIBL/5uSUou7iJE3eIg/SHxTZLhsfVs4CQu/Xn4jih+iKEFOlH?=
 =?iso-8859-1?Q?qnl1VsJMM8YGH7sGWSn1kFRzpK5gxDEGdux4+K5wEZjJyn2jhzs3/huaHb?=
 =?iso-8859-1?Q?Qyq76AFlMkgXFm0DYS43xGxuTqyd3u40Pds+E8do3BiwzpHJtL2oZYRSjp?=
 =?iso-8859-1?Q?8k+zFEouFwKVL1XvGNWYNCIjkL9/8g11Rs5h/TMOVseYySydpYd48501sG?=
 =?iso-8859-1?Q?BQWw58Wyia97in88hk9ceUgtow38gR+eDyOX0j6mecx+41LJa49LG0scV1?=
 =?iso-8859-1?Q?RTLvXoXbbrs0FzGQ0AUP+y1jRagNrEzJuro3WepS/DPOiWGA8vuQaVh5Ga?=
 =?iso-8859-1?Q?hOFV93E5RckrWS14eoT3LKry/FzSC7N2rQQFa14mkB7dj8j5dj6xysaDJr?=
 =?iso-8859-1?Q?od2kV7spub6pB978x4LHRgm9f06Z4iVlTK8c5C8YhS8TTUPpojjsoNV41l?=
 =?iso-8859-1?Q?vEXibvlLDolnRntqgFI5QyFYQu9NLTCHjYAHzTcDBgzZdI/1X+fsIWqQNZ?=
 =?iso-8859-1?Q?675qaEK8V3GqzKsh3VWHMJ4nv06/r9oNQmgYWJ4nxfn2c/8kTIOgWrLtbv?=
 =?iso-8859-1?Q?9fVwheHX5G5iXRygzUNJnkPlVOC5FI6H8mcWwIenYmVl+ppQRxXm39mHQ9?=
 =?iso-8859-1?Q?R5HWU9BdYRd3GrDSqNmC0zuq1cPpg1aoUc9Ycgkm8Aqsngbw8QATTFuUfn?=
 =?iso-8859-1?Q?8frDutkwcenvCQE28PUnwRoQXDfpVJBhdxBmTj6howKHEEo3Z4ceBlzpf0?=
 =?iso-8859-1?Q?UNVJOLWBwCEB0SadlJCQm8BBYGWdiaogGM7yqm6VjIm8uQmnuMucfX/QmZ?=
 =?iso-8859-1?Q?80l67IqTLx9r432/DWJb0cNj6yoeIgo41xAp19R4qMaKcwyf67ACjUFnfh?=
 =?iso-8859-1?Q?h7rwIQOW2XYtryJvhRgk96jJQ6NaJWP2PcsNFK93hfooPx4uLXUso+5s8L?=
 =?iso-8859-1?Q?I6qlcE2BG9ohCVp9f4FZNtzLFFkQ1Y/E3qerWm5g/05TcxiqIxDtG8f9II?=
 =?iso-8859-1?Q?vmGjlfFW5mzRWIH1EkIJYmWyC994kRyZDvScs55FIBBq6r+jcgLsl9gbDY?=
 =?iso-8859-1?Q?SvWexHUis48zqU3oXVglTU+odFXsFdtQDNqwoKyO+1d4GWHXe/kZbxoQtX?=
 =?iso-8859-1?Q?w9knJi9fpSrE4HOR04yvNzBuNI1SXmr1sCB6nQwcPqLrGmPyHV8sqtBjhy?=
 =?iso-8859-1?Q?Vye2zhD6O8oAdpKKaWMQV514MyCTc8ZhFylz7JN94yI42GlHCSX2fJfQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4744d224-8375-47c6-4fbc-08dcb6e92dba
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2024 13:59:39.3419 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pkx2rT+bdmFtnVpFcEyyRQKiFPW2g7Lij930TVFkg6MjlLc0crlG1y+A2Zc8c7g4Asv5cpR9WfvhFTYEdstrn1M2JgsnyTfUhPW+qG/n5rM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR11MB8330
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

On Wed, Aug 07, 2024 at 01:07:58PM GMT, Nirmoy Das wrote:
>Add skeleton APIs for recording and printing various stats over
>debugfs. This currently only added counter types stats which is backed
>by atomic_t and wrapped with CONFIG_DRM_XE_STATS so this can be disabled
>on production system.
>
>v2: add missing docs
>    Add boundary checks for stats id and other improvements (Michal)
>    Fix build when CONFIG_DRM_XE_STATS is disabled(Matt)

I don't understand why we are even adding a config here.
This should just be compiled out if build is without debugfs.


>
>Cc: Matthew Brost <matthew.brost@intel.com>
>Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
>Cc: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
>Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
>---
> drivers/gpu/drm/xe/Kconfig.debug   | 11 +++++++
> drivers/gpu/drm/xe/Makefile        |  2 ++
> drivers/gpu/drm/xe/xe_gt_debugfs.c |  4 +++
> drivers/gpu/drm/xe/xe_gt_stats.c   | 51 ++++++++++++++++++++++++++++++
> drivers/gpu/drm/xe/xe_gt_stats.h   | 32 +++++++++++++++++++
> drivers/gpu/drm/xe/xe_gt_types.h   |  9 ++++++
> 6 files changed, 109 insertions(+)
> create mode 100644 drivers/gpu/drm/xe/xe_gt_stats.c
> create mode 100644 drivers/gpu/drm/xe/xe_gt_stats.h
>
>diff --git a/drivers/gpu/drm/xe/Kconfig.debug b/drivers/gpu/drm/xe/Kconfig.debug
>index bc177368af6c..4db6d707c1af 100644
>--- a/drivers/gpu/drm/xe/Kconfig.debug
>+++ b/drivers/gpu/drm/xe/Kconfig.debug
>@@ -94,3 +94,14 @@ config DRM_XE_USERPTR_INVAL_INJECT
>
> 	 Recomended for driver developers only.
> 	 If in doubt, say "N".
>+
>+config DRM_XE_STATS
>+	bool "Enable XE statistics"
>+	default n
>+	help
>+	  Choose this option to enable support for collecting and
>+	  displaying XE statistics as debugfs.
>+
>+	  Recommended for driver developers only.
>+
>+	  If in doubt, say "N".
>diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>index 1ff9602a52f6..b0bbb248f644 100644
>--- a/drivers/gpu/drm/xe/Makefile
>+++ b/drivers/gpu/drm/xe/Makefile
>@@ -143,6 +143,8 @@ xe-$(CONFIG_PCI_IOV) += \
> 	xe_pci_sriov.o \
> 	xe_sriov_pf.o
>
>+xe-$(CONFIG_DRM_XE_STATS) += xe_gt_stats.o
>+
> # include helpers for tests even when XE is built-in
> ifdef CONFIG_DRM_XE_KUNIT_TEST
> xe-y += tests/xe_kunit_helpers.o
>diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c b/drivers/gpu/drm/xe/xe_gt_debugfs.c
>index 5e7fd937917a..3765c04919dc 100644
>--- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
>+++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
>@@ -17,6 +17,7 @@
> #include "xe_gt_mcr.h"
> #include "xe_gt_sriov_pf_debugfs.h"
> #include "xe_gt_sriov_vf_debugfs.h"
>+#include "xe_gt_stats.h"
> #include "xe_gt_topology.h"
> #include "xe_hw_engine.h"
> #include "xe_lrc.h"
>@@ -286,6 +287,9 @@ static const struct drm_info_list debugfs_list[] = {
> 	{"default_lrc_bcs", .show = xe_gt_debugfs_simple_show, .data = bcs_default_lrc},
> 	{"default_lrc_vcs", .show = xe_gt_debugfs_simple_show, .data = vcs_default_lrc},
> 	{"default_lrc_vecs", .show = xe_gt_debugfs_simple_show, .data = vecs_default_lrc},
>+#if IS_ENABLED(CONFIG_DRM_XE_STATS)
>+	{"stats", .show = xe_gt_debugfs_simple_show, .data = xe_gt_stats_print_info},
>+#endif
> };
>
> void xe_gt_debugfs_register(struct xe_gt *gt)
>diff --git a/drivers/gpu/drm/xe/xe_gt_stats.c b/drivers/gpu/drm/xe/xe_gt_stats.c
>new file mode 100644
>index 000000000000..b13aee5488d5
>--- /dev/null
>+++ b/drivers/gpu/drm/xe/xe_gt_stats.c
>@@ -0,0 +1,51 @@
>+// SPDX-License-Identifier: MIT
>+/*
>+ * Copyright © 2024 Intel Corporation
>+ */
>+
>+#include <linux/atomic.h>
>+
>+#include <drm/drm_print.h>
>+
>+#include "xe_gt.h"
>+#include "xe_gt_stats.h"
>+
>+#ifdef CONFIG_DRM_XE_STATS
>+
>+/**
>+ * xe_gt_stats_incr - Increments the specified stats counter
>+ * @gt: graphics tile
>+ * @id: xe_gt_stats_id type id that needs to be incremented
>+ * @incr: value to be incremented with
>+ *
>+ * Increments the specified stats counter if that is within expected range.
>+ */
>+void xe_gt_stats_incr(struct xe_gt *gt, enum xe_gt_stats_id id, int incr)
>+{
>+	if (id >= __XE_GT_STATS_NUM_IDS)
>+		return;
>+
>+	atomic_add(incr, &gt->stats.counters[id]);
>+}
>+
>+static const char *const stat_description[__XE_GT_STATS_NUM_IDS] = {
>+};
>+
>+/**
>+ * xe_gt_stats_print_info - Print the GT stats
>+ * @gt: graphics tile
>+ * @p: drm_printer where it will be printed out.
>+ *
>+ * This prints out all the available GT stats.
>+ */
>+int xe_gt_stats_print_info(struct xe_gt *gt, struct drm_printer *p)
>+{
>+	enum xe_gt_stats_id id;
>+
>+	for (id = 0; id < __XE_GT_STATS_NUM_IDS; ++id)
>+		drm_printf(p, "%s: %d\n", stat_description[id],
>+			   atomic_read(&gt->stats.counters[id]));
>+
>+	return 0;
>+}
>+#endif
>diff --git a/drivers/gpu/drm/xe/xe_gt_stats.h b/drivers/gpu/drm/xe/xe_gt_stats.h
>new file mode 100644
>index 000000000000..04a1d61ce1fb
>--- /dev/null
>+++ b/drivers/gpu/drm/xe/xe_gt_stats.h
>@@ -0,0 +1,32 @@
>+/* SPDX-License-Identifier: MIT */
>+/*
>+ * Copyright © 2024 Intel Corporation
>+ */
>+
>+#ifndef _XE_GT_STATS_H_
>+#define _XE_GT_STATS_H_
>+
>+struct xe_gt;
>+struct drm_printer;
>+
>+enum xe_gt_stats_id {
>+	/* must be the last entry */
>+	__XE_GT_STATS_NUM_IDS,
>+};
>+
>+#ifdef CONFIG_DRM_XE_STATS
>+int xe_gt_stats_print_info(struct xe_gt *gt, struct drm_printer *p);
>+void xe_gt_stats_incr(struct xe_gt *gt, enum xe_gt_stats_id id, int incr);
>+#else
>+static inline int xe_gt_stats_print_info(struct xe_gt *gt, struct drm_printer *p)
>+{
>+	return 0;
>+}
>+
>+static inline void xe_gt_stats_incr(struct xe_gt *gt, enum xe_gt_stats_id id,
>+				    int incr)
>+{
>+}

Is there a reason not to force id to always be a compile-time constant?
The only use case added in patch 2 pass it as a constant.
This way the id is checked at build time, the penalty with debugfs is
just an atomic_add() and the penalty without debugfs is none.

I think this is largely different from e.g. CONFIG_SCHEDSTATS and may
not deserve a separate kernel config: just handle the no-debugfs case,
which is mostly implemented already by not building
drivers/gpu/drm/xe/xe_gt_debugfs.c, with the remaining part being only
the dummy implementations in the header.


Lucas De Marchi

>+
>+#endif
>+#endif
>diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
>index 631928258d71..4955612fb01d 100644
>--- a/drivers/gpu/drm/xe/xe_gt_types.h
>+++ b/drivers/gpu/drm/xe/xe_gt_types.h
>@@ -10,6 +10,7 @@
> #include "xe_gt_idle_types.h"
> #include "xe_gt_sriov_pf_types.h"
> #include "xe_gt_sriov_vf_types.h"
>+#include "xe_gt_stats.h"
> #include "xe_hw_engine_types.h"
> #include "xe_hw_fence_types.h"
> #include "xe_oa.h"
>@@ -133,6 +134,14 @@ struct xe_gt {
> 		u8 has_indirect_ring_state:1;
> 	} info;
>
>+#if IS_ENABLED(CONFIG_DRM_XE_STATS)
>+	/** @stats: GT stats */
>+	struct {
>+		/** @stats.counters: counters for various GT stats */
>+		atomic_t counters[__XE_GT_STATS_NUM_IDS];
>+	} stats;
>+#endif
>+
> 	/**
> 	 * @mmio: mmio info for GT.  All GTs within a tile share the same
> 	 * register space, but have their own copy of GSI registers at a
>-- 
>2.42.0
>
