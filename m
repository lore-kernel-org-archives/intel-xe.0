Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF05ACA1005
	for <intel-xe@archiver.kernel.org>; Tue,  2 Sep 2025 18:16:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B02BA10E819;
	Tue,  2 Sep 2025 18:16:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lLJXErmI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D36410E819
 for <intel-xe@lists.freedesktop.org>; Tue,  2 Sep 2025 18:16:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756836978; x=1788372978;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=7EK9Mj9BpSWn4BVMqOId0C5md2wgmVHZ+pUYYWgioWc=;
 b=lLJXErmIOBn1WTS9Ch2wERDPRpbGxyQAjSvjOkU8hXjAkCzgk8jWO6Zk
 hj6jImfR3E9wZPQahBQRm4HZOXkr9dSDCk8RcoUvGDOVLVG0cJV74aGRM
 Ao/FVhKPe9/CUcpSK8OElVtCeRlr/YuLEzA+71QbbPYngRef1luDkyHAW
 ARYHf+e//MI2LE6eM+7LpZ0v/76jzz4vIQH+J1GmcJMiemzarYWdqP2Ms
 0iQDdQIzYJr8yu3C0s9NGTnx4s4UQtQ7dl/+kG8610M2bEhgZ4hV8WANw
 Ef9CzStHNeh/Hy9qe8eXW4D2fI8f7ZAi0bcsZbINM30RR/faJnBGd+0gJ Q==;
X-CSE-ConnectionGUID: oGjI3pEfQMCMSenOOki4+Q==
X-CSE-MsgGUID: Im++FlyoSNScBGnRhOANuA==
X-IronPort-AV: E=McAfee;i="6800,10657,11541"; a="69388501"
X-IronPort-AV: E=Sophos;i="6.18,233,1751266800"; d="scan'208";a="69388501"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2025 11:16:18 -0700
X-CSE-ConnectionGUID: CEQGHv7AQumA8jRupXN23A==
X-CSE-MsgGUID: 6pk8qcWtSv60+2P4mHVTxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,233,1751266800"; d="scan'208";a="170630440"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2025 11:16:17 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 2 Sep 2025 11:16:16 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Tue, 2 Sep 2025 11:16:16 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (40.107.244.75)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 2 Sep 2025 11:16:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nBFaw0SQGDKVLEzsBIRthMFbc6nEB4pABUb5HtbjWK3KEKiZwoWDPBmLX4GZon9mlu3f5a7JXtXtEA8HwjrYKxOHk4rTCMX5hO3rTn4ide8uVCGSgUUSMj8CNEnbHE6imxeR2uRSQLvNTHxZidAaBwLz6bZSzSksNGgwfGSenN9Fg5xVQ5ci5n4SQ/jP4kxKNlr0ELJGoax2wDXrDSfYmHhrxK4CHbEQN5ayWblgltmB2cQmgRlc6k1vrZEqL6DiIieK3UUwJhIQ9DdUi4g6y8YH350vUEUN5F81taK0VhzkK/YB6qk/09+UGCNrjP6Kmqu3M6rtoEGoyPJJjp1EGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aGqm5p0VnSU/CSS8Y2UfFpGNhRvMr05AdCY5QTeHxI4=;
 b=IWHiaClbv75sJuken5YE4FRNRYrjpu/O6pDkEfqKklQSzfdAPYZMVdU8qIl4drfwoasA/e33I0IXenboIkNKwZzrpEm+gnqr72LlVPAzSOXy7OWfBz2y1Xld4sf+r9uTFfmCGK3p6oZDeewaG6m6daTxwMd9ga0UBiQNaGPKopGRLTg1k3BNyOj+NMay6kYE4BJ7gAedlDBp7TzOsOJYJd30ZIYbThPnyDJGDY09Xm2TzWCvCO7ZmCO1Vknci8UPVB6DutAg4aOF8zRNRbjCK1CLNz3FqzTt9srKG9cya5VmVoElMaFTTuoWQDONFyCIcxFCfO0xD2lEFN32nyCxsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DM4PR11MB6310.namprd11.prod.outlook.com (2603:10b6:8:a7::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.21; Tue, 2 Sep
 2025 18:16:12 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.9073.026; Tue, 2 Sep 2025
 18:16:12 +0000
Date: Tue, 2 Sep 2025 13:16:09 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2 3/7] drm/xe/kunit: Introduce xe_pci_fake_data_desc()
Message-ID: <3cfe4r47bc3dgtp6rngxnmirhsci3t5lk2yl3nte6xu6ovns6l@oflc2wshcsny>
References: <20250829171922.572-1-michal.wajdeczko@intel.com>
 <20250829171922.572-4-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250829171922.572-4-michal.wajdeczko@intel.com>
X-ClientProxiedBy: BY3PR10CA0012.namprd10.prod.outlook.com
 (2603:10b6:a03:255::17) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DM4PR11MB6310:EE_
X-MS-Office365-Filtering-Correlation-Id: ce527183-227e-4f61-6a7f-08ddea4ccc04
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?wHF13DUIO4X73OjJrkPTUKYPq/+ybsFWfbL+wxmUzU1wJ8ymzBmSltMf7yA8?=
 =?us-ascii?Q?HYn5tgaXJovOt3JUyIFEV+bWOJy+OUK9yAKYcbOwRnowxOJz4ODmBFmWNXQi?=
 =?us-ascii?Q?axMOa39wTXNCRHF2ofcsv41Bve3+m9h6wkcgY8u+4A5tJeZaWXdFmOTuc3kp?=
 =?us-ascii?Q?u3rzJFmciBTbrhiKUb9yICX5hhKTHujhuSs5Wil1kGX7Ge//+08mbyYkurae?=
 =?us-ascii?Q?dEdwJC16PCW0Q0IGu4i1aKgZCNuyQ8WwboCf5SXd7AmhuaWnpxOsCtLc0QqD?=
 =?us-ascii?Q?OKlywW7HgIVMwc9HEi91o8OavmTlSCTvtQR+EsuFTtXGWn7defPvTj9xKLQg?=
 =?us-ascii?Q?3vIj4wNC2tU0kYIaRxg84na/8k5A5xHl7gttdjnHkT7mgvUuLVv3C4Bwf64L?=
 =?us-ascii?Q?f6crWjfKSU4li3W2qgCS8l1CnihoW6PmA8PNxv6OHOp0sYXIcNffeLYmCcBX?=
 =?us-ascii?Q?VeF2Z6K7TH0wYTFyGU2d23r7roOcBTp9VBKTQUJi8m/SxAMFPgT9omm1am9T?=
 =?us-ascii?Q?sPzeLlLtiZK+WuqgTSU9HtgDcfYHCWylLLVMkW/ljWzHCnKhATrxHMdN5Bcr?=
 =?us-ascii?Q?mrkRWDY6/PC9o6JHuieN65H+5Q2I2zvGeaxFGFzmjY3WcZr/w2ofgFjZ1ODj?=
 =?us-ascii?Q?/+1TtvjSWtgQtGBmwPosDp+lvCUO0WEHje8EpgjpWj8aDgRpFqyL02fRPxl4?=
 =?us-ascii?Q?GssrvFVSoa4/E/L0+KFLx63k8gtGUG2M6eCpTcnB3fAri8IRLXWdD8gtr/4r?=
 =?us-ascii?Q?CeT5epZQDiXFdJEBdQwfevn33xcEcEI0uKWFWIChFrdTt/DycXTvV9VLQ8Nt?=
 =?us-ascii?Q?XhNtbJy6fRttEL3b/i+BehfGMYsjlbiABBDeoal+bBO94yTk33k4zSV/TDJK?=
 =?us-ascii?Q?F0bcdsAfufQHKHRFtm8eB7s7ACUx0IOA+f0C9YmdaufkhfD+Z3MK9sPQMxOM?=
 =?us-ascii?Q?BJ94/5E/XDrSizF5XZJP34kUXreaI2eQg2jN6xL8E5pqZLHFSHqzJA/COu4C?=
 =?us-ascii?Q?yUOt8F0dPq1uidECIHsqEF2UO9E+xIfXYoq0EmAPV02pSJr2D0nCb2ez1h7X?=
 =?us-ascii?Q?nI5V8l/rI3J9haDqAGci2/K3dggwfDeJS98O1y6TC1qgfec0gyfoN+PBSqZ0?=
 =?us-ascii?Q?+DFP23lhLosmZpFzNdGEhWA2U+pIA9ziy3V3g/tLhIrP8VAI9Vc9fVQNawI/?=
 =?us-ascii?Q?a9+hKRDoPnSB2B+2qn5Ig4Tq3EhiqJBcBY/ksGlR/I0lJKa5OAWhskTiVt2x?=
 =?us-ascii?Q?oD0AOW0bKFT8UDK1P5FqLGYlXKBBzmx0ndqKOTAvJIGYugpNFQTyv7LOju9w?=
 =?us-ascii?Q?80REfPzbUdZwgTMy2USgUWeNm79KbEzaCQbQ08XePwfuce2f18tBmwE+bVwb?=
 =?us-ascii?Q?5w5bAsRhDKqpFR1tkZ0+piWsOs8tUXJC0DPtx1fVmVrxZIXnIOOw8TNguXAx?=
 =?us-ascii?Q?dufP3DpqqBs=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?oahFTFeQNUMtwLKoJ8YViES4EZcOks77yogMYYekjWYBVzp7mUz7BczIejSL?=
 =?us-ascii?Q?IOwGvkGSQN98xotNmurn6zSDolVQlb+3qmr/LH84ydOeClvDrvEFcc4zlx4w?=
 =?us-ascii?Q?UUP/D1+gHUqfSTVZsN7UMYR5bIomSlIkzZ63L6tWRE4tv/raYbAQHLa7oQYH?=
 =?us-ascii?Q?gTLQIlJtwlMS+jo12BP0dEQpYW1ZilxV6wNdHiIoPZhWkse/d7beFOq6Yq5y?=
 =?us-ascii?Q?9Ud93dHyQ56kCZXR9dRnhT/f591l7TGN3GRizBLp38Xn04M2VpBa2+I9p+LE?=
 =?us-ascii?Q?zHq1MU3rReJ1voonMuYonlQFOh5v5b4scvm7OJVAgTOQzBMqZjGCe8+91Sna?=
 =?us-ascii?Q?0UjVi/Svd4fdI+pCHAH/WK8kCsB7se+DWwdwIN1MMcLQ7vm1XwK28nrRmJ60?=
 =?us-ascii?Q?PWfczk8jJCErqpX48bab2KZkrLWW0VwB3Rkm+NC0/adQRmkwyQy4qIcA/QhJ?=
 =?us-ascii?Q?eMaPOc0UsUbQTHzZymCGPPMobL2VCYZyVoC1FNXdQNne8tLw53p0dkKryun5?=
 =?us-ascii?Q?85yrh90t78/aj2LapLrVnQ3FNBo9cl2FrV5KWd1qtsDWUt8UMo93tX+ec6U1?=
 =?us-ascii?Q?vng41BoNOd0OyNgrMQjrxMdcsk62zQH6yRpqNuDqm/RqHM5bk7QgtLrtsPwv?=
 =?us-ascii?Q?CMFOzn0YNlw2+byhRy83+HWWWsB2K8oyJVrwk1cUa9NcizgjpDuZ5FjjeIpu?=
 =?us-ascii?Q?6WPzztyhu+K/XJbmLxj0kLgb7Yj9h7fvVR5gMDub2o6SjoS924JdvEjXQbHp?=
 =?us-ascii?Q?F1vqYxTjIYiKAcBtMOXvGtadVksTZY3uTVWwWCxtR6yl6DdnvV0447P0Namh?=
 =?us-ascii?Q?ntwJH1TTI1sQS/gMdXly888/p5Gb/OVw2f1V8oi3QKeyMOR+fl7LY139RhJa?=
 =?us-ascii?Q?F9AsH3infssxFU4+mzNStFSFxDEXEi7tIWbIwv+TB1wuNnSxtp89xc3GJzyj?=
 =?us-ascii?Q?aiy0F3qw0R+hxuCpZ/ObVgoAtCRJ8sBTrWG38acx5f6tqTMBDD/VrJi6mfYu?=
 =?us-ascii?Q?dJjhjZL/srAiMJhPgj5QtRrxUk3tlUqrv9+IQ/pjv2OTxW7hLHrxSgBFHwsz?=
 =?us-ascii?Q?gKEMZ/EXTTiVUCRgGGyjE7R1PZpLdbcfg7xL6pPu77oxpx1F7H3okjT3w0uB?=
 =?us-ascii?Q?ylwIfwxge73gaAPMttBWnlrAFCO3wkoasJRT2IDWNVNZ9xE37hXYFTTdVbWE?=
 =?us-ascii?Q?APfThJ3GJ07ZqUdtCrqotZp6qTjA1QYlXtQINcrr9pS5p0tStqxvye5TAFiU?=
 =?us-ascii?Q?Ao1sfRXSLlQR0Ax2Wqdu6Ydsj5uUVgyfxrzdbQ0IVAWD7tiiCZhNBj/b7zqH?=
 =?us-ascii?Q?XLiyI/OzNH3tjaDhI+Y5/4f3fjCt5KCoNOTB0I2jZLknISwVxBjRFtUHLlv8?=
 =?us-ascii?Q?Xgro5liNMIF3q+gv244inOcNhYR2cRZ4B4kdCApPuAKkPpAFojSzfE8VZXOI?=
 =?us-ascii?Q?PsZpuVOZYX6EETZSajVM8+eoDwFkK0zaIA11CQP8KB6Sl5TPq/0JZHCID3pO?=
 =?us-ascii?Q?qGQYB+whFlEcasfyOHEKliDzZf+3yohor4HGRMx0cFuRcZLS70a1bCLgsHxo?=
 =?us-ascii?Q?UX/ApLjlenUJNzokWd24dMZV3kboOHAcIAGDVCpB+tSdossG0SdML+lTNeZK?=
 =?us-ascii?Q?WA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ce527183-227e-4f61-6a7f-08ddea4ccc04
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2025 18:16:12.0275 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KL2TChVr4xUXlmuNInrN7l+/z7kSw24eXbjrsg8daE3t6p7U1NX1/DHC/bukmbpRtiL9R3EfXnctWTvvgqN3bCqjBGOyz/Jpe10YyuPmtho=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6310
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

On Fri, Aug 29, 2025 at 07:19:18PM +0200, Michal Wajdeczko wrote:
>We already use struct xe_pci_fake_data to provide custom config of
>the fake PCI device and soon we will be using this struct also as
>direct parameter for the parameterized Xe KUnit tests.
>
>Add function to generate description based on that config data.
>
>For platform or subplatform name lookup pciidlist which already
>have definitions of all supported platforms.
>
>Examples:
>
>  TIGERLAKE
>  TIGERLAKE A0
>  TIGERLAKE SR-IOV PF
>  ...
>  PANTHERLAKE 30.00(Xe3_LPG) 30.00(Xe3_LPM)
>  PANTHERLAKE 30.00(Xe3_LPG) A0 30.00(Xe3_LPM) A0
>  PANTHERLAKE 30.00(Xe3_LPG) A0 30.00(Xe3_LPM) A0 SR-IOV VF
>
>Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi

>---
>v2: don't look at vendor/class_mask (Lucas)
>    use %u.%02u notatation and print IP name (Michal)
>---
> drivers/gpu/drm/xe/tests/xe_pci.c      | 117 +++++++++++++++++++++++++
> drivers/gpu/drm/xe/tests/xe_pci_test.h |   1 +
> 2 files changed, 118 insertions(+)
>
>diff --git a/drivers/gpu/drm/xe/tests/xe_pci.c b/drivers/gpu/drm/xe/tests/xe_pci.c
>index bb0ce0dc9b31..a8b35439131f 100644
>--- a/drivers/gpu/drm/xe/tests/xe_pci.c
>+++ b/drivers/gpu/drm/xe/tests/xe_pci.c
>@@ -12,6 +12,123 @@
> #include <kunit/test-bug.h>
> #include <kunit/visibility.h>
>
>+static const struct xe_device_desc *lookup_desc(enum xe_platform p)
>+{
>+	const struct xe_device_desc *desc;
>+	const struct pci_device_id *ids;
>+
>+	for (ids = pciidlist; ids->driver_data; ids++) {
>+		desc = (const void *)ids->driver_data;
>+		if (desc->platform == p)
>+			return desc;
>+	}
>+	return NULL;
>+}
>+
>+static const struct xe_subplatform_desc *lookup_sub_desc(enum xe_platform p, enum xe_subplatform s)
>+{
>+	const struct xe_device_desc *desc = lookup_desc(p);
>+	const struct xe_subplatform_desc *spd;
>+
>+	if (desc && desc->subplatforms)
>+		for (spd = desc->subplatforms; spd->subplatform; spd++)
>+			if (spd->subplatform == s)
>+				return spd;
>+	return NULL;
>+}
>+
>+static const char *lookup_platform_name(enum xe_platform p)
>+{
>+	const struct xe_device_desc *desc = lookup_desc(p);
>+
>+	return desc ? desc->platform_name : "INVALID";
>+}
>+
>+static const char *__lookup_subplatform_name(enum xe_platform p, enum xe_subplatform s)
>+{
>+	const struct xe_subplatform_desc *desc = lookup_sub_desc(p, s);
>+
>+	return desc ? desc->name : "INVALID";
>+}
>+
>+static const char *lookup_subplatform_name(enum xe_platform p, enum xe_subplatform s)
>+{
>+	return s == XE_SUBPLATFORM_NONE ? "" : __lookup_subplatform_name(p, s);
>+}
>+
>+static const char *subplatform_prefix(enum xe_subplatform s)
>+{
>+	return s == XE_SUBPLATFORM_NONE ? "" : " ";
>+}
>+
>+static const char *step_prefix(enum xe_step step)
>+{
>+	return step == STEP_NONE ? "" : " ";
>+}
>+
>+static const char *step_name(enum xe_step step)
>+{
>+	return step == STEP_NONE ? "" : xe_step_name(step);
>+}
>+
>+static const char *sriov_prefix(enum xe_sriov_mode mode)
>+{
>+	return mode <= XE_SRIOV_MODE_NONE ? "" : " ";
>+}
>+
>+static const char *sriov_name(enum xe_sriov_mode mode)
>+{
>+	return mode <= XE_SRIOV_MODE_NONE ? "" : xe_sriov_mode_to_string(mode);
>+}
>+
>+static const char *lookup_graphics_name(unsigned int verx100)
>+{
>+	const struct xe_ip *ip = find_graphics_ip(verx100);
>+
>+	return ip ? ip->name : "";
>+}
>+
>+static const char *lookup_media_name(unsigned int verx100)
>+{
>+	const struct xe_ip *ip = find_media_ip(verx100);
>+
>+	return ip ? ip->name : "";
>+}
>+
>+/**
>+ * xe_pci_fake_data_desc - Describe struct xe_pci_fake_data parameter
>+ * @param: the &struct xe_pci_fake_data parameter to describe
>+ * @desc: output buffer with minimum size of KUNIT_PARAM_DESC_SIZE
>+ *
>+ * This function prepares description of the struct xe_pci_fake_data parameter.
>+ *
>+ * It is tailored for use in parameterized KUnit tests where parameter generator
>+ * is based on the struct xe_pci_fake_data arrays.
>+ */
>+void xe_pci_fake_data_desc(const struct xe_pci_fake_data *param, char *desc)
>+{
>+	if (param->graphics_verx100 || param->media_verx100)
>+		snprintf(desc, KUNIT_PARAM_DESC_SIZE, "%s%s%s %u.%02u(%s)%s%s %u.%02u(%s)%s%s%s%s",
>+			 lookup_platform_name(param->platform),
>+			 subplatform_prefix(param->subplatform),
>+			 lookup_subplatform_name(param->platform, param->subplatform),
>+			 param->graphics_verx100 / 100, param->graphics_verx100 % 100,
>+			 lookup_graphics_name(param->graphics_verx100),
>+			 step_prefix(param->step.graphics), step_name(param->step.graphics),
>+			 param->media_verx100 / 100, param->media_verx100 % 100,
>+			 lookup_media_name(param->media_verx100),
>+			 step_prefix(param->step.media), step_name(param->step.media),
>+			 sriov_prefix(param->sriov_mode), sriov_name(param->sriov_mode));
>+	else
>+		snprintf(desc, KUNIT_PARAM_DESC_SIZE, "%s%s%s%s%s%s%s",
>+			 lookup_platform_name(param->platform),
>+			 subplatform_prefix(param->subplatform),
>+			 lookup_subplatform_name(param->platform, param->subplatform),
>+			 step_prefix(param->step.graphics), step_name(param->step.graphics),
>+			 sriov_prefix(param->sriov_mode), sriov_name(param->sriov_mode));
>+}
>+EXPORT_SYMBOL_IF_KUNIT(xe_pci_fake_data_desc);
>+
> static void xe_ip_kunit_desc(const struct xe_ip *param, char *desc)
> {
> 	snprintf(desc, KUNIT_PARAM_DESC_SIZE, "%u.%02u %s",
>diff --git a/drivers/gpu/drm/xe/tests/xe_pci_test.h b/drivers/gpu/drm/xe/tests/xe_pci_test.h
>index 32452bd65bff..1195839999ab 100644
>--- a/drivers/gpu/drm/xe/tests/xe_pci_test.h
>+++ b/drivers/gpu/drm/xe/tests/xe_pci_test.h
>@@ -24,6 +24,7 @@ struct xe_pci_fake_data {
> };
>
> int xe_pci_fake_device_init(struct xe_device *xe);
>+void xe_pci_fake_data_desc(const struct xe_pci_fake_data *param, char *desc);
>
> const void *xe_pci_graphics_ip_gen_param(const void *prev, char *desc);
> const void *xe_pci_media_ip_gen_param(const void *prev, char *desc);
>-- 
>2.47.1
>
