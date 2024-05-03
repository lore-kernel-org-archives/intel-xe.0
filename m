Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74C18C4345F
	for <intel-xe@archiver.kernel.org>; Fri,  3 May 2024 02:40:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21C621127DA;
	Fri,  3 May 2024 02:40:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EyiuxpbE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B85A01127DA
 for <intel-xe@lists.freedesktop.org>; Fri,  3 May 2024 02:40:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714704051; x=1746240051;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=J/8whHOrUygza1JuAvr19tDcUC8Gc4Jjcb3DEVFEizk=;
 b=EyiuxpbE0m90qifrUCNievWZ368RNAdgh3zlyHZWGhtVvECSWPAxbP7K
 81EliNoYuWxJPzNVxxjTTC4I6ADyRLVV89+w3yYyuZTirgPjLc2FlNUAO
 WKHYJcYQsEV9uXTT9oDMDLiYPjRXiZp69b+2MZGTKpCTbNeOOcsEtDouT
 +Kmbu6bbcP+lCj4gv6eGzwy7YEcPlmj0yxwEpf2dJuiWP8AwjK+UAiksG
 +6UV9V0Xfd/pgVxDPiAmZQPWj19Y1gxk8EjJYyfldHFTknPbHRiTHLixP
 S95Cn9MXXGo4VH6am0u2lQw26NZF0YX8QXsYT/GUb0I7F9d22APJbfvYz Q==;
X-CSE-ConnectionGUID: kaFzDKu6RzSxjR8FjfhvDg==
X-CSE-MsgGUID: V62IaWy4RnG0re38OhxPsA==
X-IronPort-AV: E=McAfee;i="6600,9927,11062"; a="10631391"
X-IronPort-AV: E=Sophos;i="6.07,247,1708416000"; d="scan'208";a="10631391"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 May 2024 19:40:50 -0700
X-CSE-ConnectionGUID: t68xdsmmTqeScI1o6ts46w==
X-CSE-MsgGUID: ez3SYuqDRCWc2IeXDSKiWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,247,1708416000"; d="scan'208";a="27833957"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 02 May 2024 19:40:50 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 2 May 2024 19:40:49 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 2 May 2024 19:40:49 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.41) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 2 May 2024 19:40:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wq2d7ROFoj8a/VOfwbRqVLmJcuHYixo+h6QkehZ7Nl8J+qHyDXzffTWBpHKGb853oHg8wYbIddeVGCU0QnyBc525dLcPV4oAxY1REEJ+RgCjps5+8dXuJy8MbFQADJVZsGRyvVv7/5sZNdQoeLVLZNK7UKWitJCE8FJXEYHb1wYgamOIKRyJ9pRA8eh1FsC4rJ8jWx7575j7P7/7dFRDaPQF32IV8UXQ6in7xhd8TVpsHWU06AD3Pig/fgo4d28fYPQXcZxxcprJkFITF1jmOjtZLMoEhfvSSt7zeKLr0sJjJSjvj2MnkaLJ25i4Oqea31uVwi2dAk4WPyqxj8O27w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C5Yry12gcy3KH6TmDWZ57HvoViJXJRReoVod15OsYTM=;
 b=aYt7JFqf0B2fkh6J/s4eWjP2urfujVxkkJ1vapVeySgQZBwaTOvNWc4PygdEq9IbtUXqumfTIGIYuvSws5CnoYCoj4zFXyH7+dHl5SZTkaPdsKdW5e2xB03bMCSC4XSYGH5yOxRQRSQQOfAD4G2LSmeT43jEtARg26SPlX2vkInB/5cCe+DsEY8ZQl9ArP03sRjNaD4JZEBJ+774AkQttBNytJRzi0jaFRhKyCfJdyAt5Q9J+GLdniJ7rmHYk/k4f6amX4vlUZD0HCPi6YQ5NIcUr87ZXe2bRDwrpPOtvueO4ZG0VYNb1rUYVx6CO/r4BoPG6ZbB1SNkWtYzAUGWng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SA3PR11MB8119.namprd11.prod.outlook.com (2603:10b6:806:2f2::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.32; Fri, 3 May
 2024 02:40:41 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::9365:d8e6:4e8d:8711]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::9365:d8e6:4e8d:8711%6]) with mapi id 15.20.7519.031; Fri, 3 May 2024
 02:40:41 +0000
Date: Thu, 2 May 2024 21:40:38 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v3 2/3] drm/xe/kunit: Add simple tests for new xe_args
 macros
Message-ID: <nm6o2b4ftycrqtqi74qaxdqcyflpa27yude7k3jhsyemwvyxsz@wtaffcwrsq4s>
References: <20240502223313.2527-1-michal.wajdeczko@intel.com>
 <20240502223313.2527-3-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240502223313.2527-3-michal.wajdeczko@intel.com>
X-ClientProxiedBy: MW4PR04CA0215.namprd04.prod.outlook.com
 (2603:10b6:303:87::10) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SA3PR11MB8119:EE_
X-MS-Office365-Filtering-Correlation-Id: bbff78c8-0b19-47d5-3832-08dc6b1a6c3d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|376005|366007;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?FFDGyqV7HNCWBUgiKLZUiWbwHFe+g8npUDAGS37aUGqxT51SoNkD7IluFc?=
 =?iso-8859-1?Q?QlLgXo5i4lgXYETGx5hh/UQWU6mQPs9cJhBO4lA0jH359RsYf7mWMrqANA?=
 =?iso-8859-1?Q?BmkhQJdLy/YjXI3kr9dMiYikJJuh8t0mqIp0dkbt5hOpSS3RwzJM2KHTFT?=
 =?iso-8859-1?Q?2aLlnPoszAfIeAD/lQpBHXyDqCYinyAmYYQ5xoLJO6O/0+uuvNEiuidrAi?=
 =?iso-8859-1?Q?CPc6zhL8OE49olYmZJJTXJ50cB1tguu9TEpXOGqmfV2yIwINLT7cvhN86R?=
 =?iso-8859-1?Q?MEPsoaXwryx5OK7ZdAITcXbxRzF6ybtRM/i0zJdNN1/gdwrKh8Puir7yYU?=
 =?iso-8859-1?Q?vepXo1hSV+B9xLERyCv9eY3ha5QYEI6BrBy3YsA1tJn0mmrTxO1wjIceaG?=
 =?iso-8859-1?Q?Eg2nY3CqxWpFbIO1RlDF5qtGkaECqWHYVfCud96Xy1H0c0WTZu6/UP6wwi?=
 =?iso-8859-1?Q?Q923LWR6bEGyBQ67Pg77ch5crtL74LvQ3+bSTW8XDxiMGyp2REKVAPTHfS?=
 =?iso-8859-1?Q?Bum2JByXQ8Z5wLCgBmTnrTEgeWTO1sTUwI6m32BbLNvZNy2XWVXEKKSbzE?=
 =?iso-8859-1?Q?O/UG250Re17gi+Is6pJWra2k1qrLqrHC1Tmbyi5t+bf40Vif3PlJe7I6mw?=
 =?iso-8859-1?Q?7SN6Iy+xNr+nB+pd2VXGNbwajSyW761fhS9JAHn29eTZ2ZwKXftXQ6XlfY?=
 =?iso-8859-1?Q?Je++5F4xSnbDi/SNP/JoLhlIFB9Zc9Jw4cYiqJRd0XKOdK+OAhWuZEJ8gG?=
 =?iso-8859-1?Q?tezI2U3IzJC9KwjGKliJDegAnCuTgyYsAAH9vIy9+ac1NVw/uC6YjTRHmI?=
 =?iso-8859-1?Q?mFclplQQm9SXOPRj5B4HIskWaG9qW9jeB3rZZwU8jyAl8lMKAsH2qat5ln?=
 =?iso-8859-1?Q?HrHnfuDyEVGmxU0bhlZs9u1Iba6VoATuEzSF6kKr0mYqLrY66n24iJfT2S?=
 =?iso-8859-1?Q?8uDAx/Rt8VZHkL0xbXLoOJdRUAY0UmVFCXruV+IkiinONtR+Y29GL7jocu?=
 =?iso-8859-1?Q?QIUnN8S2OTxefVulLkWcEH5k7DFq9WNGKtX2CqSH50BBSx7/UJ+iMMNB77?=
 =?iso-8859-1?Q?svpAzTnaHOiGTrq1LgyoBaSoiHPDBXOxvm+FUfrB4yjx8ThhpeuuZa58og?=
 =?iso-8859-1?Q?Ls2mdvew2l83ydtuNGgAMixDvHWa1psIrx3g/7QV6lMTUdnm/Z3w1SSCdp?=
 =?iso-8859-1?Q?x9w07wLNzuzLVBS8tDCO3B+vWxeJBRaoC2ZblO6aCQC37of2O4Yx0KucEd?=
 =?iso-8859-1?Q?SAUEdiAsb4zOSu4wY81ik/ULKjHLg2SOZ2ICwyetH15Kt5xDONd/vdepwQ?=
 =?iso-8859-1?Q?Z1DOagr+BcxbWZXM4EEWBQf0Rw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?tolQjQPaOYowxdEb7qWTw9Bw2D9Sq628D92myFZpq3jTxIi7wG+uVdJhMc?=
 =?iso-8859-1?Q?hUMzP9MGvJbxh/FcoqCVkXSmYSpoqaCXpGm5b0K6QOhjAv2Ci+n1NuOdaR?=
 =?iso-8859-1?Q?JDFnmir3TMUavysFp4xcSfvzt31Cb9DNFfFWsSZ91/IAH4gf5IMre9KatT?=
 =?iso-8859-1?Q?pZAl8iEaq8gnZSXib1jEzU5cOkZmkOHJ8AJBMPAZqSyFnZnblCsJ9Tunr2?=
 =?iso-8859-1?Q?TVOXdU78YeCy6nP4HYdEIWX4E4T5R6Nub7iCqtpZ170/1c9rGtjEtE220k?=
 =?iso-8859-1?Q?OrgVu2MIhX0Fr8zAmQ18/fExm1GqbEs1JiCCLx5ODapSHFaVAQhXBSpjkc?=
 =?iso-8859-1?Q?NX+KcFT5tNsDbNhH7Gjquid2PGVajUTw2Ttioek3coqBltsYEZ024++KNq?=
 =?iso-8859-1?Q?p680OURP49KHZCB51JlVnN+AD3EMLrQ2SrnoCTJp3HNsXucjMuflTM+1rQ?=
 =?iso-8859-1?Q?8BtdsSkFhKFp9zaPnoP5LD1Qj4Diz9ohvBEizsJXEZG+jI72RzdEKv5Kri?=
 =?iso-8859-1?Q?EB1vk0RRXTPeSIGUNfMig9+6HKpD1sDc/fGud+CdgJ8qUOb7UpSL86sbtI?=
 =?iso-8859-1?Q?PA/ZzdCNWa7PR69jwQEusZNJs8fG/cM0Y2p1iQSm3Us2TLQDgxd//wyl2A?=
 =?iso-8859-1?Q?JHE9O78793Q4ocJCeEaQDMZf1zIeyW+13N/a27hEH59RtClcyZE+5KH5Dc?=
 =?iso-8859-1?Q?0Hckevuk/KvKSOVGUNVcIYhoNNgpdLZwdrgvFP/xF4uFOLGB/uguL3XddT?=
 =?iso-8859-1?Q?LxGBopm2cDW0kFmsEfW976WLn4MwxJoX5koaqSOX6UUALHzYYIQfKqY3dm?=
 =?iso-8859-1?Q?52kssmJJ/dyQUtZtsBXc7Zih4AXm9Ag2rMpjwQa06IWQpjcxjAIGKD+Dtn?=
 =?iso-8859-1?Q?kRXEBLYze+0vYYAF/Dz1Lq6IIi/oZX0/9fANX+tglkkOk2M658hg6ZtJvx?=
 =?iso-8859-1?Q?asH8UAcTnHeLrrUURo+2ivhHz05lm0uZb8GziCh4wBJllK7eLdFtW02ueG?=
 =?iso-8859-1?Q?mkKe5bYLx+pUSu7aE9e0THge64S1wpjOVza3P+fg4gA4ZqOt+UMNkNeBp1?=
 =?iso-8859-1?Q?S9Y8W5EPp4DR5ow1hRkRGsf+EUXV1Q3POE+ivb3n4JzjUFlZZgAz2hRQjS?=
 =?iso-8859-1?Q?C1hiV/AdZGOScfc6AV97BKZuX3NNLssSK/tHLk/GR7pEY0MB98lTyN9sym?=
 =?iso-8859-1?Q?V55Oj6YbrCbs/g2mIQ8NtkuI9k5gCxXXgBtpGVuwBFxdy/703vbLV8YL4F?=
 =?iso-8859-1?Q?m4NfVNKbXa7ZTZVl9yk9jBJomJRF/RI6cpqxUefp3PDy9NitgX/T/AsyUP?=
 =?iso-8859-1?Q?AufKEvWiRNxaQ/38oCAsS7zCtu/+zzVEvqzeMVqPpROlpU9xj0hOEcGg69?=
 =?iso-8859-1?Q?KdDwe1B00jp0FYyGP37vNWtNYu3LlJOv7SbFfuJFFmwYdbnpKGZjfd92yM?=
 =?iso-8859-1?Q?OScCPshJNs2k3b8NUZpuOyIv3UHZRDH5ukuV4WabLeBEutYmyvUYlrwGHN?=
 =?iso-8859-1?Q?1PgENdix8kKw0XCjWH0OSRhQWfHEQuUV2untZCV0zxW9kUVbBXKqHuBnz+?=
 =?iso-8859-1?Q?Eri4aDXAkXlXmzh2WxFEWiQNQ+W5yzUSB/6xfAoEQu2C1yFwVFHVY1VGgT?=
 =?iso-8859-1?Q?2TnpSulmbR33eee0KgFGOQzrCKaY6cHrU65YDKoWais0q4n+HUEF7BLQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bbff78c8-0b19-47d5-3832-08dc6b1a6c3d
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2024 02:40:41.2317 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NQq5HWLRYA/g5pwzrcgY/QHuOLAWxyDRr6I4wUUlfeNMZzb5G78IfAbl6wchVYV+FUwEjSqXID5GCltjalQl6M7D/va/Sd1d19P2upogdt4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB8119
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

On Fri, May 03, 2024 at 12:33:12AM GMT, Michal Wajdeczko wrote:
>We want to make sure that helper macros are working as expected.
>
>Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi

>---
> drivers/gpu/drm/xe/tests/Makefile       |   1 +
> drivers/gpu/drm/xe/tests/xe_args_test.c | 190 ++++++++++++++++++++++++
> 2 files changed, 191 insertions(+)
> create mode 100644 drivers/gpu/drm/xe/tests/xe_args_test.c
>
>diff --git a/drivers/gpu/drm/xe/tests/Makefile b/drivers/gpu/drm/xe/tests/Makefile
>index 8cf2367449d8..6e58931fddd4 100644
>--- a/drivers/gpu/drm/xe/tests/Makefile
>+++ b/drivers/gpu/drm/xe/tests/Makefile
>@@ -11,6 +11,7 @@ xe_live_test-y = xe_live_test_mod.o \
> # Normal kunit tests
> obj-$(CONFIG_DRM_XE_KUNIT_TEST) += xe_test.o
> xe_test-y = xe_test_mod.o \
>+	xe_args_test.o \
> 	xe_pci_test.o \
> 	xe_rtp_test.o \
> 	xe_wa_test.o
>diff --git a/drivers/gpu/drm/xe/tests/xe_args_test.c b/drivers/gpu/drm/xe/tests/xe_args_test.c
>new file mode 100644
>index 000000000000..9b44c1ab6364
>--- /dev/null
>+++ b/drivers/gpu/drm/xe/tests/xe_args_test.c
>@@ -0,0 +1,190 @@
>+// SPDX-License-Identifier: GPL-2.0
>+/*
>+ * Copyright © 2024 Intel Corporation
>+ */
>+
>+#include <kunit/test.h>
>+
>+#include "xe_args.h"
>+
>+static void call_args_example(struct kunit *test)
>+{
>+#define foo	X, Y, Z, Q
>+#define bar	COUNT_ARGS(foo)
>+#define buz	CALL_ARGS(COUNT_ARGS, foo)
>+
>+	KUNIT_EXPECT_EQ(test, bar, 1);
>+	KUNIT_EXPECT_EQ(test, buz, 4);
>+
>+#undef foo
>+#undef bar
>+#undef buz
>+}
>+
>+static void drop_first_example(struct kunit *test)
>+{
>+#define foo	X, Y, Z, Q
>+#define bar	CALL_ARGS(COUNT_ARGS, DROP_FIRST(foo))
>+
>+	KUNIT_EXPECT_EQ(test, bar, 3);
>+
>+#undef foo
>+#undef bar
>+}
>+
>+static void pick_first_example(struct kunit *test)
>+{
>+	int X = 1;
>+
>+#define foo	X, Y, Z, Q
>+#define bar	PICK_FIRST(foo)
>+
>+	KUNIT_EXPECT_EQ(test, bar, X);
>+	KUNIT_EXPECT_STREQ(test, __stringify(bar), "X");
>+
>+#undef foo
>+#undef bar
>+}
>+
>+static void pick_last_example(struct kunit *test)
>+{
>+	int Q = 1;
>+
>+#define foo	X, Y, Z, Q
>+#define bar	PICK_LAST(foo)
>+
>+	KUNIT_EXPECT_EQ(test, bar, Q);
>+	KUNIT_EXPECT_STREQ(test, __stringify(bar), "Q");
>+
>+#undef foo
>+#undef bar
>+}
>+
>+static void sep_comma_example(struct kunit *test)
>+{
>+#define foo(f)	f(X) f(Y) f(Z) f(Q)
>+#define bar	DROP_FIRST(foo(ARGS_SEP_COMMA __stringify))
>+#define buz	CALL_ARGS(COUNT_ARGS, DROP_FIRST(foo(ARGS_SEP_COMMA)))
>+
>+	static const char * const a[] = { bar };
>+
>+	KUNIT_EXPECT_STREQ(test, a[0], "X");
>+	KUNIT_EXPECT_STREQ(test, a[1], "Y");
>+	KUNIT_EXPECT_STREQ(test, a[2], "Z");
>+	KUNIT_EXPECT_STREQ(test, a[3], "Q");
>+
>+	KUNIT_EXPECT_EQ(test, buz, 4);
>+
>+#undef foo
>+#undef bar
>+#undef buz
>+}
>+
>+#define NO_ARGS
>+#define FOO_ARGS	X, Y, Z, Q
>+#define MAX_ARGS	-1, -2, -3, -4, -5, -6, -7, -8, -9, -10, -11, -12
>+
>+static void count_args_test(struct kunit *test)
>+{
>+	int count;
>+
>+	/* COUNT_ARGS() counts to 12 */
>+
>+	count = COUNT_ARGS();
>+	KUNIT_EXPECT_EQ(test, count, 0);
>+
>+	count = COUNT_ARGS(1);
>+	KUNIT_EXPECT_EQ(test, count, 1);
>+
>+	count = COUNT_ARGS(a, b, c, d, e);
>+	KUNIT_EXPECT_EQ(test, count, 5);
>+
>+	count = COUNT_ARGS(a, b, c, d, e, f, g, h, i, j, k, l);
>+	KUNIT_EXPECT_EQ(test, count, 12);
>+
>+	/* COUNT_ARGS() does not expand params */
>+
>+	count = COUNT_ARGS(NO_ARGS);
>+	KUNIT_EXPECT_EQ(test, count, 1);
>+
>+	count = COUNT_ARGS(FOO_ARGS);
>+	KUNIT_EXPECT_EQ(test, count, 1);
>+}
>+
>+static void call_args_test(struct kunit *test)
>+{
>+	int count;
>+
>+	count = CALL_ARGS(COUNT_ARGS, NO_ARGS);
>+	KUNIT_EXPECT_EQ(test, count, 0);
>+	KUNIT_EXPECT_EQ(test, CALL_ARGS(COUNT_ARGS, NO_ARGS), 0);
>+	KUNIT_EXPECT_EQ(test, CALL_ARGS(COUNT_ARGS, FOO_ARGS), 4);
>+	KUNIT_EXPECT_EQ(test, CALL_ARGS(COUNT_ARGS, FOO_ARGS, FOO_ARGS), 8);
>+	KUNIT_EXPECT_EQ(test, CALL_ARGS(COUNT_ARGS, MAX_ARGS), 12);
>+}
>+
>+static void drop_first_test(struct kunit *test)
>+{
>+	int Y = -2, Z = -3, Q = -4;
>+	int a[] = { DROP_FIRST(FOO_ARGS) };
>+
>+	KUNIT_EXPECT_EQ(test, DROP_FIRST(0, -1), -1);
>+	KUNIT_EXPECT_EQ(test, DROP_FIRST(DROP_FIRST(0, -1, -2)), -2);
>+
>+	KUNIT_EXPECT_EQ(test, CALL_ARGS(COUNT_ARGS, DROP_FIRST(FOO_ARGS)), 3);
>+	KUNIT_EXPECT_EQ(test, DROP_FIRST(DROP_FIRST(DROP_FIRST(FOO_ARGS))), -4);
>+	KUNIT_EXPECT_EQ(test, a[0], -2);
>+	KUNIT_EXPECT_EQ(test, a[1], -3);
>+	KUNIT_EXPECT_EQ(test, a[2], -4);
>+	KUNIT_EXPECT_STREQ(test, __stringify(DROP_FIRST(DROP_FIRST(DROP_FIRST(FOO_ARGS)))), "Q");
>+}
>+
>+static void pick_first_test(struct kunit *test)
>+{
>+	int X = -1;
>+	int a[] = { PICK_FIRST(FOO_ARGS) };
>+
>+	KUNIT_EXPECT_EQ(test, PICK_FIRST(-1, -2), -1);
>+
>+	KUNIT_EXPECT_EQ(test, CALL_ARGS(COUNT_ARGS, PICK_FIRST(FOO_ARGS)), 1);
>+	KUNIT_EXPECT_EQ(test, PICK_FIRST(FOO_ARGS), -1);
>+	KUNIT_EXPECT_EQ(test, a[0], -1);
>+	KUNIT_EXPECT_STREQ(test, __stringify(PICK_FIRST(FOO_ARGS)), "X");
>+}
>+
>+static void pick_last_test(struct kunit *test)
>+{
>+	int Q = -4;
>+	int a[] = { PICK_LAST(FOO_ARGS) };
>+
>+	KUNIT_EXPECT_EQ(test, PICK_LAST(-1, -2), -2);
>+
>+	KUNIT_EXPECT_EQ(test, CALL_ARGS(COUNT_ARGS, PICK_LAST(FOO_ARGS)), 1);
>+	KUNIT_EXPECT_EQ(test, PICK_LAST(FOO_ARGS), -4);
>+	KUNIT_EXPECT_EQ(test, a[0], -4);
>+	KUNIT_EXPECT_STREQ(test, __stringify(PICK_LAST(FOO_ARGS)), "Q");
>+
>+	KUNIT_EXPECT_EQ(test, PICK_LAST(MAX_ARGS), -12);
>+	KUNIT_EXPECT_STREQ(test, __stringify(PICK_LAST(MAX_ARGS)), "-12");
>+}
>+
>+static struct kunit_case args_tests[] = {
>+	KUNIT_CASE(count_args_test),
>+	KUNIT_CASE(call_args_example),
>+	KUNIT_CASE(call_args_test),
>+	KUNIT_CASE(drop_first_example),
>+	KUNIT_CASE(drop_first_test),
>+	KUNIT_CASE(pick_first_example),
>+	KUNIT_CASE(pick_first_test),
>+	KUNIT_CASE(pick_last_example),
>+	KUNIT_CASE(pick_last_test),
>+	KUNIT_CASE(sep_comma_example),
>+	{}
>+};
>+
>+static struct kunit_suite args_test_suite = {
>+	.name = "args",
>+	.test_cases = args_tests,
>+};
>+
>+kunit_test_suite(args_test_suite);
>-- 
>2.43.0
>
