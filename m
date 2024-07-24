Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 051A7C3DA63
	for <intel-xe@archiver.kernel.org>; Wed, 24 Jul 2024 17:53:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E07110E782;
	Wed, 24 Jul 2024 17:53:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kfpx6fq/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A18D910E782
 for <intel-xe@lists.freedesktop.org>; Wed, 24 Jul 2024 17:53:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721843614; x=1753379614;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=v2aVjay4+MI1xG/Zf6QsyQn0SHKRE8ggpBwStg2H4fU=;
 b=kfpx6fq/iyreuVrZYZUUgPhhKGyS/hqWu0/8PD0BDqGMDTVHdimrv9Pb
 pt2r5gUuWo3lBQhz+03RuhNFtlTGaOc6fRkNg84b1p5D2ZsrG4q62NQSA
 2fEyK//E7F87DT8QlbNb4NJfRySg2nHizRMIhe6EiEkIh8adDK+QTKNvy
 ZweRx1OsNueoPsD1M0GEnZeG1GqmRB4UtOGu1ApJooWDt0jVJa/rt5W7Z
 zLLPqBD3ZXSZwPjsg9Jo8IJdGTOtV84uo49SC/CNEc96Zfp7Vy5d+J5bu
 sQHGNnD1mgWJbHp2cDGC/t7Zd1AYqO6wpjU9bULURkWF4FYt3gBqOS7bs g==;
X-CSE-ConnectionGUID: vNoUeFAMR2KsZ7X3QA/JIg==
X-CSE-MsgGUID: sLeIaiFnShi+4KLO3NwzxQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11143"; a="19153164"
X-IronPort-AV: E=Sophos;i="6.09,233,1716274800"; d="scan'208";a="19153164"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2024 10:53:22 -0700
X-CSE-ConnectionGUID: Cb6gt52WTueRewfrp9WK2A==
X-CSE-MsgGUID: iQBiL8AMSzaZfFT5Y6qM+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,233,1716274800"; d="scan'208";a="83669497"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 24 Jul 2024 10:53:22 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 24 Jul 2024 10:53:21 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 24 Jul 2024 10:53:21 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.41) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 24 Jul 2024 10:53:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ep5pJPaxQW/hLpjD6syumXJhruPRD6uDe2cnGFOhlhp310ckDZlOaO0L9ye7q4U5pvO3qUolNJPV+bn8nYSqHY1qeZLW8oE+nL8JD81lVSrEVHPSELEyBfjquWj5E1oEZzC06Bje8VK1CZv1O6roM0EfYOfchxT0Ffy/JdT24vtVBK6Vyllx1eMZXjgyJpm0il7cOCkaHLvY2KsCVnXpZKU3SJLlQknmL3vlUigxs7XAr8EYMqIX1C8nAxEGisFc1nWXzCGJJoDBHk/9Jk7FIi2bYjI/3oHCMeda/cpUIlYYqUPE+/KP6GHT7kIz6z2I6g1xXFfytCYJ/xGXDE5vlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w2c9T4Dq7G2vk8Qv9MiJmGBC9AxCq6h1zkC2HfMBcgQ=;
 b=mHSwRgay5uZJLyEsIcp8cnDU2nnkkcqeMxBqp6iIFP0YniRT6risoqGU7yhH2qD8aKnvJqCc0Os6jFhBhfVdBERYqiNgAwlYVPdEYbUJTntbxNP6VcHoJti0TK+0vf2YwfkXR6KfsfxY/MnjMFYFsV7MwP+0utdiLCq35uijkJUOolAcCu4xAZRWqGBaDi+H5+1IvK9mKu0xw80oESHGma63SitzluifCH5DAFcKvD6y6W02IHWRFE/dKyLnafJveEsQF1QSmfFu6oRRMbY/HfVq4usf2eCycTxbWV8NTIBytIlSn8F+DOfYXLI044oFKyGaxp0avchQeKL12oYQvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SJ2PR11MB8540.namprd11.prod.outlook.com (2603:10b6:a03:574::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.17; Wed, 24 Jul
 2024 17:53:14 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.7784.017; Wed, 24 Jul 2024
 17:53:14 +0000
Date: Wed, 24 Jul 2024 12:53:07 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
CC: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>
Subject: Re: [PATCH 1/2] drm/xe: Delete unused register from xe_regs.h
Message-ID: <zdexywf2dn3cibtoi45po422ucfwb47py54pcu5vvhnfupy2ko@llr5nns6km2f>
References: <20240715105555.2220444-1-himal.prasad.ghimiray@intel.com>
 <20240715105555.2220444-2-himal.prasad.ghimiray@intel.com>
 <SJ1PR11MB620416EAAE7A6BAE9368159881A82@SJ1PR11MB6204.namprd11.prod.outlook.com>
 <27476ff3-3cdb-4b51-add4-4e071986a5b2@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <27476ff3-3cdb-4b51-add4-4e071986a5b2@intel.com>
X-ClientProxiedBy: MW4PR04CA0261.namprd04.prod.outlook.com
 (2603:10b6:303:88::26) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SJ2PR11MB8540:EE_
X-MS-Office365-Filtering-Correlation-Id: fea69aca-a431-4c75-a731-08dcac097d7d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?nj1ni/AmN0g+P61DnFiiUmQrnxCzwjMeC7+V3oRUKIJGiJnfja6HLsdVpAoO?=
 =?us-ascii?Q?uz1PGNmSj208PsnLGx7x0LVsfnJDV+QqUTyLcSy9a7J9itdosLDtPwvfbnA8?=
 =?us-ascii?Q?Btcvnyxq1uAupbw/05j+gGLzEvYoYu1ubij4NaWCfjvjUeRKiLvAN8Pvggv3?=
 =?us-ascii?Q?fqVEaDKwx+HGsqXCQZjLAUnIwp7ihkUdcAhwJBYAkGEmC6atwIIrHRsvXSet?=
 =?us-ascii?Q?ndh2QPRCl7nQOI+AvHLRceCiPFzvPis1k0GvrboxBpuXKZSP0LO8sVeHz1O4?=
 =?us-ascii?Q?72Cio7O2a1dFSTADkayhAHydqu7Xn0OUwcw9b7an+Qidghk3mQ6RFiJxJpEt?=
 =?us-ascii?Q?OBThis7fkpyAJjNamdvy+BJQzZB/8jr6gdfwQdevg6uQTjETs3CAOYKEleeL?=
 =?us-ascii?Q?2+GxxN9d8BKGd/omiwyJ/OQ4x/IWjCVrNIa2MbGu39hXvFug7avz9N9ZTCa4?=
 =?us-ascii?Q?LoV15ynGvTmnDGmPB67TUXgxJwMJHgOyRg33xvQm5R6tuvYRGdtBs+Y0Pw7b?=
 =?us-ascii?Q?Z5m72mAaGfCPmUuHRT58ZvFBDfXYBCYDJE34VFYHPevJqX0TSFly3UASXMQ9?=
 =?us-ascii?Q?SlcTn4haoU8i9LcBDaP/yX1cFIiEsa97u83JDNUKy+uYNxCq0lT4hwjIuIJX?=
 =?us-ascii?Q?PZ08Xoo6fp1j7x+LlzV8xyQCP1znIZB3VMWa6jIhpR0hPQ3m9fKzIbWtUQNI?=
 =?us-ascii?Q?/BcPj6u2CPaP1qkkbwRrDkbYs8NcN7AwqYwSpn0nA9TSmRvmE10SB0eFe5Bn?=
 =?us-ascii?Q?7SkQLC49pyIPCLUrOtXwfcr60jr65hJL6NhfnpScj68LzCKemJA/HgDfifvB?=
 =?us-ascii?Q?XICxpXtOUk5rvHMY0RaNC4qW6M+Im5KkGt0s/zCl6sh/0Do+8jE6Xa5dEtGx?=
 =?us-ascii?Q?GRLWbCuA4U/w4K+d8E4lybW6Z8ozbsakeqcEHlnfK5Ac4MoUpS/x3wn2AqSj?=
 =?us-ascii?Q?2KnIXEExjKvTqxSWkqDRiiPSYD8qgKp6XcT81Jd/pqmNm59m9tL3FGUu4bJf?=
 =?us-ascii?Q?xaUKTJN/+7kQ4R/OSrGuAqmv96t83CUKj81XHVFQHVEvVBdZU4WhFVuDKgFQ?=
 =?us-ascii?Q?9EwzA+eI9ZdEkDqtpSBYqqBfFY4JBTa1Vu1Pwv4EVb5sMSE7KxedioXZ6PGk?=
 =?us-ascii?Q?atqzUWpGCQvhGgnFIFlz3bVlvKjer1nSmSptp6xOJuKIvDTW2/8v9m4T/nyK?=
 =?us-ascii?Q?K96BbJfGD1HwZaPlVWvqO9WAL/FZvpkoEFZN0Wd9DLl6ifj7kiNmbKlqDW3w?=
 =?us-ascii?Q?4Mp0EXhf0wZ5as/qlex3zpi1h5e6GA+IRa9DiSwzS27mnTi2asTmdFNH/hY0?=
 =?us-ascii?Q?QhM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?mQJ2K+095fO3m84MUeWJjEqhqOLQLhX8Uoq72qIp20FE9tAqJLY+cP8KJhrx?=
 =?us-ascii?Q?r2oApjbCNQRK2iWATm3mpe3pzS4umxKRasKj1WugfHXiE6em2HS/kSQNg2Ua?=
 =?us-ascii?Q?pp78/V8BMF3dGQur85IDkgAoMl5HEYknPjdIO7OMoXz3zZkYVLjPoNJDYBJB?=
 =?us-ascii?Q?20TCed23Clm+xC4Yjm4UgbYc3Qg8aUWXQElNabtxWAdNBIfXy3UAabJJvgOg?=
 =?us-ascii?Q?4jr8JVCE43CDkPjSehJPBETO8BbDQ3TMCY0n36IYSrfKNK/7+ttqbCdMiVju?=
 =?us-ascii?Q?XTYxK8GE4WlmZaQbxGURqVHzBOmOUSG1+AdKEkdJn1Lq8FeP1RF5uakXZvta?=
 =?us-ascii?Q?bwSPD/pTdqBKj+HaU5VQGDTOobhQxFB5f5N5dbLEgvsUxLfXYslhhAKkKdWF?=
 =?us-ascii?Q?t4CIgpgu3+Mmo/zDzaaRgT5T3Xg9vEd4RcVkyVhSB17BbxqkJc+weypBAGeO?=
 =?us-ascii?Q?REk4d3ITEnHmtpDe2qj9qfkmyW/Afu4gQy/elUF1datiyhCJcjDfq9A5m30b?=
 =?us-ascii?Q?PTEUcA8qiJ/Z5da5u4CPSZfEbT+S/A03G2Ai43NvYBRYVgeL7JilMHY9lDCv?=
 =?us-ascii?Q?nEdt0NMOuu3OiXoP6faY9QvVsVu6tP7cqC4kQD2WVRlnl82Xn+TY+JJTd7fE?=
 =?us-ascii?Q?8klSfPcDpuzDlWdmsnP/P7Aqe9wFStW+GwQYggbTJ1l1wTGstzr30K8Xqnto?=
 =?us-ascii?Q?2jUcaKELSYMeVvDo18iHuqnCtuATHMd9M56SWW1UxtvACyLaaAyXHnuJg4SC?=
 =?us-ascii?Q?wo/SaNMVm3uOlfelph8Bt4olhCynWDo7NS+yestskdid3bjzrPbD/k2NCl6G?=
 =?us-ascii?Q?Zb7k8fZMuQsTevTUqj9ZJeYsTomBJ7h3XkyKtOpECYyWdbB8fMzDgqOovyn/?=
 =?us-ascii?Q?7CISjhpioxBKCz00lFPVMZGoJZk9AxooZhdEJ5zaGg33wA7PN3ezOYRynptp?=
 =?us-ascii?Q?ee7zyt3NX/UXe4segzfv6e4GzTKhtT4zUDi/sTdpFSA2DmEjEKJJ3H3ryHs/?=
 =?us-ascii?Q?od+g9bOTfj6oFFXzWVGcbcFEYOTp4clKZEBJ6my4VyZ0CkECBOper0Od00E1?=
 =?us-ascii?Q?6lmrZ/hqRjYiPo8sP9DuNMu/dxnvPhwHT3wa8L4m/gS5hRxHU+otkWiDsGYq?=
 =?us-ascii?Q?CuhGbRjUmHC7Q4jNNKb8eolELGKT3kaItunbZTFdaVOFX557NH0yYowvXwYB?=
 =?us-ascii?Q?pxTMOQV98DQNu/YjxdMDvyOluq+oMMnxLv0Df7OyayI2RZa+JARJ+zaDMD9O?=
 =?us-ascii?Q?MFZDxvqk2XrJ4MWDKtMoL0OUBig4/rypVq854V7cFNrfhSp/t2jJ3G1OCtkz?=
 =?us-ascii?Q?QLQ4lsG3nIAmE/gyPKwhq1PrNaCuYoeXwSN9AloDaimFZCMDKnXVw7h/Vywf?=
 =?us-ascii?Q?5jqaT/8Qr554fzNzW1/JoH4UA2NM1l3fmuzuwo3vHIHgpBawWiXzlFVm9tGg?=
 =?us-ascii?Q?NM8TsYOaSyudtlbLQmrLDVPAWW7OUEJzSKeSIOYKZXn/y0er9ZFiezzwLeDc?=
 =?us-ascii?Q?wfeCr2SM8vCF95rE4gA216FFS+wI42PkbfTY5LLSqcvlxqVSNczf1u5V5vso?=
 =?us-ascii?Q?IhgiX9JUE9ALj+FZTLCgtGd9Do13kYvenHBfWzPwiyNxyHaoDphJRoVUGetS?=
 =?us-ascii?Q?ag=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fea69aca-a431-4c75-a731-08dcac097d7d
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2024 17:53:14.1375 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mHJhhAxBVHb8PiQTN4ZPrQP4wA11d2epjlgDKsPTIdHe+lvHFznBszTzvspPMrQjY0k5kIutztNtJIOD6Uoy3TrBX8gY45AP3/4bYQVSID0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8540
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

On Mon, Jul 22, 2024 at 10:42:23AM GMT, Ghimiray, Himal Prasad wrote:
>
>
>On 22-07-2024 10:23, Upadhyay, Tejas wrote:
>>
>>
>>>-----Original Message-----
>>>From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Himal
>>>Prasad Ghimiray
>>>Sent: Monday, July 15, 2024 4:26 PM
>>>To: intel-xe@lists.freedesktop.org
>>>Cc: Ghimiray, Himal Prasad <himal.prasad.ghimiray@intel.com>; Wajdeczko,
>>>Michal <Michal.Wajdeczko@intel.com>
>>>Subject: [PATCH 1/2] drm/xe: Delete unused register from xe_regs.h
>>>
>>>Register SOFTWARE_FLAGS_SPR33 is unused; therefore, delete it.
>>>
>>>Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
>>>Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>>>---
>>>  drivers/gpu/drm/xe/regs/xe_regs.h | 2 --
>>>  1 file changed, 2 deletions(-)
>>>
>>>diff --git a/drivers/gpu/drm/xe/regs/xe_regs.h
>>>b/drivers/gpu/drm/xe/regs/xe_regs.h
>>>index 55bf47c99016..dfa869f0dddd 100644
>>>--- a/drivers/gpu/drm/xe/regs/xe_regs.h
>>>+++ b/drivers/gpu/drm/xe/regs/xe_regs.h
>>>@@ -15,8 +15,6 @@
>>>  #define GU_MISC_IRQ_OFFSET			0x444f0
>>>  #define   GU_MISC_GSE				REG_BIT(27)
>>>
>>>-#define SOFTWARE_FLAGS_SPR33			XE_REG(0x4f084)
>>
>>@De Marchi, Lucas I see you added specifically this register in below commit, was there any purpose ? To me it looks fine to remove.
>>
>>commit 8cb49012ac171698b1253dea45e56c284e997d38
>>Author: Lucas De Marchi <lucas.demarchi@intel.com>
>>Date:   Sat Feb 25 12:10:39 2023 -0800
>>
>>     drm/xe: Do not spread i915_reg_defs.h include
>>
>>     Reduce the use of i915_reg_defs.h so it can be encapsulated in a single
>>     place.
>>
>
>The register was being used for ensuring write barriers in dgfx 
>earlier. Which is modified to use VF_CAP regs now.
>
>For background of the register usage.
>https://lore.kernel.org/intel-xe/20240702183704.1022-4-michal.wajdeczko@intel.com/
>
>
>
>>If no concerns from Lucas, then
>>Reviewed-by: Tejas Upadhyay <tejas.upadhyay@intel.com>

Applied to drm-xe-next. Thanks for the patch and review.

Lucas De Marchi

>>
>>Thanks,
>>Tejas
>>>-
>>>  #define GU_CNTL_PROTECTED			XE_REG(0x10100C)
>>>  #define   DRIVERINT_FLR_DIS			REG_BIT(31)
>>>
>>>--
>>>2.34.1
>>
