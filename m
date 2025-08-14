Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15828CA0EDC
	for <intel-xe@archiver.kernel.org>; Thu, 14 Aug 2025 11:13:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C54EC10E849;
	Thu, 14 Aug 2025 11:13:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HP75Pl6Z";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC27C10E849
 for <intel-xe@lists.freedesktop.org>; Thu, 14 Aug 2025 11:13:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755170033; x=1786706033;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=MfZlQljPy7Bhn7shmY02vxbPrFUvJALPAQ7VIPOzNNU=;
 b=HP75Pl6ZshMHJIzoT4OooYqYka8+ncJuvnWi2GRilnEQva5WTfa5OcEd
 PhCzg6S6NmOXmDRcIsc9HKJ5oQdjm6K0zO4b6UbaKFuO8gQiwOJrdrOo+
 vjWonfzxqDIDFL1u74Z1TdbKKbgeZi5KOYWFjsJzQCBQsWU4oH/PhG3N0
 KaxgR4B6YgRCz5PTyIE9eiXY3anVNRukJPERisqiClA+H8+o0Z6//Ryfg
 lDVF/iamKg+p9S8eHLux14sP2l8sm4Vr5gq691mmkUxYLwhOEopBSufKg
 elypikrPOXTDgK2iAQV7cz6+Jxam2PZ1IGKMhP/EByBrUGsh5J6z7rtKF g==;
X-CSE-ConnectionGUID: 9kn4VUieTy6tm+gcUSjkOw==
X-CSE-MsgGUID: KmDs6sOcQuCsWwF/KtedgA==
X-IronPort-AV: E=McAfee;i="6800,10657,11520"; a="57598587"
X-IronPort-AV: E=Sophos;i="6.17,287,1747724400"; d="scan'208";a="57598587"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2025 04:13:53 -0700
X-CSE-ConnectionGUID: 8xBZajAfT+C9SDHnPAzcUQ==
X-CSE-MsgGUID: LDagUcKVQT+4OpYMj2fyHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,287,1747724400"; d="scan'208";a="203916420"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2025 04:13:53 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 14 Aug 2025 04:13:37 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Thu, 14 Aug 2025 04:13:37 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (40.107.92.50) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 14 Aug 2025 04:13:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E8YCke72KSuzrVeKGxhmPo+6yyxLmyPm/cYoxfyLjnN7QcpZAvlVClBXUQXY/zrXFxb+bWWzCaOiMCLyyOiegiXOf3W9AwvLj0svwfm9FYEwdp0wNJGRtWQxbzGcYvOvQELy4MY+3ZoNnAZBAVcsRn5D63VgZqLJREaS16Nnu1TxDqoJ1ddreDByx7LlderhrmDHVa02d1oOiCmNUl9+vuuKu/V1+xvcZa8WYS5d7QgWp87efmtm24h36zG75FtiC+TWbMibH9eYnD2eIGonfe3vve3O4tncEjngSIdaJMmCxb2+xFNAaR3AYum4pUXqfqBfQZSCyEn25BBzpEoIdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7C/ae0Ongyljcmc/shE/FFpH9n3NgE0k8esH8pb0PUY=;
 b=dY0eudBMDEw0CMYafIwOkn2zE3/xA9rk/nGiMQAeUcZUNNAkubeSwlj73CdSqIBr+rikNNjfzP+JFVrAf7+W9Qg+ZYCG4omAJkO0DR9VJt9SXKJcaX1c9I+S3momRBr8ct6m+XKYfkDYC8/y2PWrF8aiRlfLTEF7qrifQ6+lavZ0oxuDIFYbiLtyaj4V/DCueAM/JmLIVBr1SfFv2yx3VHmpBOJBGI4IOU7ETDRrPe0YGa3XrS+2Cz73FD8bRYuarIVPM2sqmofTpOZPwIfnNYiQVxaBLB++e2/gXM4eaSIUALd4Z5APjpjAGOOPD6dlYPfBe4kb5E95nWx/7R0SGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by IA1PR11MB7918.namprd11.prod.outlook.com (2603:10b6:208:3ff::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.13; Thu, 14 Aug
 2025 11:13:34 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.9031.014; Thu, 14 Aug 2025
 11:13:34 +0000
Date: Thu, 14 Aug 2025 08:13:26 -0300
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <prashanth.kumar@intel.com>,
 <dnyaneshwar.bhadane@intel.com>, Badal Nilawar <badal.nilawar@intel.com>
Subject: Re: [PATCH v3 04/13] drm/xe/psmi: Add Wa_14020001231
Message-ID: <tvr47sjamlp3wpji4goscfayhd6tsog42i2zwbs5rumidoh2yd@hcagnhfdf7w4>
References: <20250808-psmi-v3-0-a111e9f1e4b7@intel.com>
 <20250808-psmi-v3-4-a111e9f1e4b7@intel.com>
 <785763f2-7d3d-4c53-b12d-62ef345249e5@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <785763f2-7d3d-4c53-b12d-62ef345249e5@intel.com>
X-ClientProxiedBy: SJ0PR13CA0216.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::11) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|IA1PR11MB7918:EE_
X-MS-Office365-Filtering-Correlation-Id: 02dfa0ec-b6f5-42f7-e1cb-08dddb239bbf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?wS39spq9psZbrE5fubrP0YFDllzgKAxyF9uFacE6sa8x58LWxLF52dlSagt2?=
 =?us-ascii?Q?03YpUD+gyDMWKYKyMuz6qodTsjdp+BBZB1qMKpVCgbCZ3dnRdp5/MO43gJW9?=
 =?us-ascii?Q?4e0Zh9HQZR5xiCyylQuLLf5o49s3yLvj0llZ51eUYWLWewugIY3JezcZ+4UK?=
 =?us-ascii?Q?E0Q03/llFuVwXrLqCAswJbLAqYsupBFn9l+x2LlnLYwDalRzdCTE3+7lygQS?=
 =?us-ascii?Q?bKaXaYKBkQttTL38ml6Pm6bLbd14227p7hRWHt2m8bswNF5k7Ih9bigz7BPY?=
 =?us-ascii?Q?mOFtt1WzTBCKgNvAt29TcztbC/TkS8r/XiBjw6lf4JSU9yYsuoAOpv5o28vo?=
 =?us-ascii?Q?HK+UmWVi92G9pfCAbireHwtSn2tuGaSpRybXiIOsDzLzHv9n5nm+IAWQYClY?=
 =?us-ascii?Q?x7T/JI/ZDJ2E1pTBZR1tDmxqQr9xiRLpRTpqFgMQRvd6lC13c48TKe8Ye+3w?=
 =?us-ascii?Q?kdIuevdy++ACSGvflwt9PK0mkFFsRKF8+57Ww9+WRvegrp9+ufEo4lK1ZNoQ?=
 =?us-ascii?Q?vj2PIbJSB1tHgQVbFbk/ti167bZpS9pjbhWDRedea8Em+48+YxtpiCXoey18?=
 =?us-ascii?Q?yPYyg+kiGCRNCOZ8U8lKODjscnREJK/dTYwUG+Ip8HfDP495R0PyX3jDQ2Hq?=
 =?us-ascii?Q?vXydkf4Q6Y/95Ivgm5Vu53gAhNl/ExAmabZYzDr7bPrRQg1uotYU/ajVxqH5?=
 =?us-ascii?Q?P+J7IUuXWQqD8blfVWEBqK1Wktu9HRAisZlZTNeZ60bzXdgDpIKPhDEWv3+c?=
 =?us-ascii?Q?veZYde7Yj2zTGo3W9NBjrZxB0fuxDwYiCY4lXAuzBdS9kDEDB7EHur9YcO8y?=
 =?us-ascii?Q?yZ7Skb+zQMH7+1uKJnsOvHygBH+p6pfQCcs3zTv7OqpnKy0LgzyLCBYKmrss?=
 =?us-ascii?Q?JGxpkHVdEDCC7LozpPSMFWka56A/ZTaSTf4aQuduoTB/6nzib+8gSB/35Okd?=
 =?us-ascii?Q?RTVFzxV3gzUaEvdMyCaexf1P3cRU27hhGUNFIGDfAP2oFYjttb+Byk5NMdyl?=
 =?us-ascii?Q?lStZ5ft22gNOgzoNaaUZTpzb0iALlqtKtknyOCu9vhKxySJw7ou7+C4MbiWh?=
 =?us-ascii?Q?b+MI41QURWwyrw8TaXb6uVKHm8p1Mxao+rHpuJ5RUTelQxsP44VYbmnvUxCK?=
 =?us-ascii?Q?U3jhSk2I6uxSARFEgwYUcX7aaVKiIysHIZs6v8ykQb0+9z46dvMmuT7UuRbb?=
 =?us-ascii?Q?+0Zj8p0yLZwsHiLStXgwe+Fgg4X+H1nXHpY/vMHRId+d1EixcFsxzMgj7c+w?=
 =?us-ascii?Q?YQE3jG5s2xuIyFt5lvD1XYhC7Ul0H6Kl9WKRXVB0C0ES5LrtsNQ4ZXvnv+Cy?=
 =?us-ascii?Q?fh3Ruh2BLtqNQHBSdZDBu266tj3QdJFAFvxQl8dGubOmoKr3jkqywHyDASHz?=
 =?us-ascii?Q?+SRr23X+0hNxsiboKCz/DdPpj+Um67hVJU2TlbdHXxL4c8F5AdQpg2DjlhzJ?=
 =?us-ascii?Q?Eh8O9s9OtzA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?L0A871obcoCH+rJmb7aHacHR5rTDQYH5xYGH+w6ukrXGl8BV+Hashn/7X3zQ?=
 =?us-ascii?Q?vO3BawuqzgYjBRe6VYJmMaVvdmwv/hjL/oQfzkjI3DXsHYpCzPYolLodAYac?=
 =?us-ascii?Q?Rz0SP47aBTpGIZp8JBDjhPJRH+J37b7Ko7INo8ZTcpCaVQejTMtqhYkExBfb?=
 =?us-ascii?Q?sLfV0SEKtFhNqMmdU81GY0jW6cG8EM75LbSvUJHPCDPsx3mFk4RwyK1Wui6Q?=
 =?us-ascii?Q?wSE47WvrvEtiK9hb2tom0btQs825VrRdwPfZHFeB7tatvSRH87CWT/+SQers?=
 =?us-ascii?Q?qkjNJGouLPykos9hmZsxayU2VwQ/DDvRpLwkiWtkOzQ0lKoXRQ1gaehmTkJb?=
 =?us-ascii?Q?fJ3oJiZ+7m4KXMbeQcJVa+87ieGsYzmbXozlPrYD7gHNrupfQnfK2cSTKi/6?=
 =?us-ascii?Q?yqj2XOPDKCiF5q/AQYf4K78ysQKnU0T0KXs4KfrI/x9Unqw0DVbvfdp2ihTo?=
 =?us-ascii?Q?0vO1kAdPoMU68NpKXCGX5DAYdD/tA0ZeQLjojbcjEOgG8LuOBhEFCr+Dbs7O?=
 =?us-ascii?Q?h+oWVhzVDc55W5octCR+n/gcgmq6o0V4Ide0reZB6f4lnHpYa3/uQcwvr4nu?=
 =?us-ascii?Q?rPtA7egpscX2B8ZcjtekvLs1LYdtSj8DKkhcDMsmjctqOz0Ow/vL339d+ypg?=
 =?us-ascii?Q?Z15neP35wvtbT1uNQY8TFFqqbkMKfpvn2MSxR+RtUKg15WWfifq6HuKr0nzp?=
 =?us-ascii?Q?O5iStKiiIxofAgXBlGXrfiXO2sPTE1rf2OxykmJXNuUmfjg9tgWsBVPPyvwG?=
 =?us-ascii?Q?r1x0Oa8GVojwzokw1Aswl29C26qdMccn6/vhciSiBu6Dj7jAY6Tyoeqm5XiY?=
 =?us-ascii?Q?6+1IPt25QqOHkouDrsI9ayQTARbrd0FDgqk3gBl8NE50/qyBaNyJemce1Ef8?=
 =?us-ascii?Q?khdPyQS8na4RlgfOKmY8XKh1aVVJ8FmPiCttP2Ik3xMOnHudSCJTvUvd5Ihj?=
 =?us-ascii?Q?EA+W+30x6TiKGA5BO5cDORA3Qb2CkNNxaKLksJxpMX19WKBBVEo4+h1Eqd3t?=
 =?us-ascii?Q?9g2yBDnjoC9gBoIgkbuKVFQTJIPwbqU4qKnOg9fO+rmL2sBRIxS9MCYdUi83?=
 =?us-ascii?Q?lxc+jgZnU6Tyzm486D6goa//IkuKk1tVt8jRSIlo7/v/6k+oiA/eRc6ScQth?=
 =?us-ascii?Q?ifqNPwRCBPP/vNALkV0aGQDOveHuQAjTJ2eWlmt1p+NbHI98+xzuPRyaMW4c?=
 =?us-ascii?Q?Jw8hc2tFn8j0+1v7AK4u6AJRBzD5QFBrBfnoRg9ZDCVD/giMYOak2xlO/AJ9?=
 =?us-ascii?Q?G5H4CDw0jMCskbRzl+m9+4mWtu+FIjcI4NUTlczr3rcNHl9cdtBmvSc4x7f7?=
 =?us-ascii?Q?fVvBq/nllQTx6Y27pqYyjqVlYwpBv9kJID+WYW6322NRSGzJYaYWYaBjuJOS?=
 =?us-ascii?Q?/wR+pi/QozoM9bsu23hEXtgPM5w55jCiT3b+CKWTaqgkOAamZP6TUowwD1sD?=
 =?us-ascii?Q?UbLaHDafrwjydHAuGFoiCG0q4knliI/f+nY6EBfzPrOrGPbioRdjYSYR67nj?=
 =?us-ascii?Q?L9ymhvdJVOCmLyiQlAnqNOWUzNto/rd5TG4pjcNy5n9BUAnzmgsyXGko4f0v?=
 =?us-ascii?Q?V+BOvxLD6Bf7QOHrzrEEkTMm8wrmg6lmFefAUtyN7KApnCxChjTDfuDIIgs9?=
 =?us-ascii?Q?fg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 02dfa0ec-b6f5-42f7-e1cb-08dddb239bbf
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2025 11:13:34.2254 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RSMKLnaYaR+TconIpnR5IZUU7ww9XNtRBZ9S+9qEQzCTBod37pb8aEEaR30/0D5es7nnbUwAU8gZk2so1fmd9u5v0UcZisSsBY79loV7QQY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7918
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

On Wed, Aug 13, 2025 at 11:14:57PM +0530, Riana Tauro wrote:
>
>
>On 8/8/2025 10:59 PM, Lucas De Marchi wrote:
>>From: Badal Nilawar <badal.nilawar@intel.com>
>>
>>Enable Wa 14020001231 to block psmi interrupts during C6 entry exit
>>flow. It's only enabled if PSMI is enabled in runtime.
>>
>>Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
>>Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>>---
>>v2:
>>  - Enable only when PSMI is enabled
>>---
>>  drivers/gpu/drm/xe/abi/guc_klvs_abi.h | 1 +
>>  drivers/gpu/drm/xe/xe_guc_ads.c       | 4 ++++
>>  drivers/gpu/drm/xe/xe_wa_oob.rules    | 4 ++++
>>  3 files changed, 9 insertions(+)
>>
>>diff --git a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
>>index 31dbfeee289e7..0e78351c6ef5a 100644
>>--- a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
>>+++ b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
>>@@ -390,6 +390,7 @@ enum  {
>>   */
>>  enum xe_guc_klv_ids {
>>  	GUC_WORKAROUND_KLV_BLOCK_INTERRUPTS_WHEN_MGSR_BLOCKED				= 0x9002,
>>+	GUC_WORKAROUND_KLV_DISABLE_PSMI_INTERRUPTS_AT_C6_ENTRY_RESTORE_AT_EXIT		= 0x9004,
>>  	GUC_WORKAROUND_KLV_ID_GAM_PFQ_SHADOW_TAIL_POLLING				= 0x9005,
>>  	GUC_WORKAROUND_KLV_ID_DISABLE_MTP_DURING_ASYNC_COMPUTE				= 0x9007,
>>  	GUC_WA_KLV_NP_RD_WRITE_TO_CLEAR_RCSM_AT_CGP_LATE_RESTORE			= 0x9008,
>>diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
>>index 2ceaa197cb2f0..c42fc78798ca0 100644
>>--- a/drivers/gpu/drm/xe/xe_guc_ads.c
>>+++ b/drivers/gpu/drm/xe/xe_guc_ads.c
>>@@ -359,6 +359,10 @@ static void guc_waklv_init(struct xe_guc_ads *ads)
>>  				 GUC_WA_KLV_RESTORE_UNSAVED_MEDIA_CONTROL_REG);
>>  	}
>>+	if (XE_WA(gt, 14020001231))
>
>
>This commit has changed XE_WA to XE_GT_WA. Both WA patches need this change
>4d5c98eb77fe ("drm/xe: rename XE_WA to XE_GT_WA")

yep, I was waiting for reviews and comments to settle/resolve before
spinning a new version.

Lucas De Marchi
