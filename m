Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BE61CA0ED1
	for <intel-xe@archiver.kernel.org>; Mon, 18 Aug 2025 16:23:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 464FB10E07F;
	Mon, 18 Aug 2025 16:23:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G+4d2aEl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C6F210E07F
 for <intel-xe@lists.freedesktop.org>; Mon, 18 Aug 2025 16:23:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755534226; x=1787070226;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=+7YLWPxgsWy32gR6Q1xioMhxrTM0li7c32CM8ETwk8g=;
 b=G+4d2aElZHX+XNLzBqVzP0kEWBfo903cQqfeBsf5k/YwxD8Lk1Ame5nE
 0xpAIWLtC7Uq1t1fj3agYomSWVmlNMbafa8Vm/rWojAgWGSNV1u/D+UgM
 cEIbileHqQsnupexL+AMeVDtkbdb4/lNelq/+hy3ZWFPpwBfSTWXlG7AE
 robFymwHypz4KqfHqlHt6IwlFzJLVSBEc4HQPonBDi8mDP7ugJC7qeQG0
 8g/J2RpmImJrqbyDJysNeN8MYJL+1VKJktQUV06rBKJDcoak5NRujfYNk
 3cbCbfBIdmYz/yam+EICDkpokaF4fJxu1g++a3KYmCMTIVR24OqsMSYdy Q==;
X-CSE-ConnectionGUID: 14RIFWSsRryyc84VEENpjw==
X-CSE-MsgGUID: grOgre7jT1qgfgp0FlfnYg==
X-IronPort-AV: E=McAfee;i="6800,10657,11526"; a="68028671"
X-IronPort-AV: E=Sophos;i="6.17,300,1747724400"; d="scan'208";a="68028671"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2025 09:23:46 -0700
X-CSE-ConnectionGUID: 3rxaOBZCQSSFricy1y02qg==
X-CSE-MsgGUID: mlanWVRcSf6jZwPmkq7mYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,300,1747724400"; d="scan'208";a="168419971"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2025 09:23:45 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 18 Aug 2025 09:23:45 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Mon, 18 Aug 2025 09:23:45 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (40.107.101.41)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 18 Aug 2025 09:23:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XA7RymvQdZFcvYXyqpN65D7c/zT1Ds13rSoF4zzROTrUONUcNwlLRENzg8x/tRpaSsSDsD5zMPfBXYZFYDwrnA7Yz0Fp7bVv2/8rxjxf+KSnitHXdZcY18rUMXLPC/Qy7h/+nP4BAj0V/feIilp13tYqhn8a5t3zBvXCNHFoWGdygi48Y+q7/T73gqaYWCdWW9vIhGOnjdpJTXjbONmOmdlPArV+JuzxUToPMA9pyyiHOxDdkG9ICQDEbCaH0l5NA3ekv2a4ucFHNBYglvXi7yFVhS+tC5hYJ/7zlGKN+7ejVthXIETYbanwzfNF4j9o1pKwhfq6S+w0dkQztENvnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uI2qpLpgdzikM8dayLE+e87jdUpyIMsLAbNy/5iJY/0=;
 b=IqGzZ3vw/6uMsFpbSi94gwJlBeROYnHiucZ7Tm8rBrXyFm46JUrA9UJVCWRAJxwYKPUAEvLyb1qmru/LdPJg8X9ey/blaRMscmg5Cqn9iu0KeWECwkOr7HIyEGICOwVTS97JSIkoHaZnAbAl2wms27w5nhWEhBDLdjhTcawyFSVM3NdB4DOxnEabtgSM38BaGpFB/tfOagvt0lFkL45vDyLQuCQ64WU7hEcmHWwvjKZLZ+JS/80Fyux7R/L08ow7EP9X4Aam9nYYJIpNCcWcn6/kblq5154EdOxixl1FOc9If+29U0kxYhxkRqAjbGdM9AuLLOhmhIjkGVPB5DnsrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DM4PR11MB6381.namprd11.prod.outlook.com (2603:10b6:8:bd::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.24; Mon, 18 Aug
 2025 16:23:37 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.9031.023; Mon, 18 Aug 2025
 16:23:36 +0000
Date: Mon, 18 Aug 2025 11:23:32 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 4/6] drm/xe/kunit: Promote fake platform parameter list
Message-ID: <jo25ezng3v6di5kv242y5nlqcllmrwjx3tguwj4obrizckclgz@cwmjieiwpton>
References: <20250801181350.180780-1-michal.wajdeczko@intel.com>
 <20250801181350.180780-5-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250801181350.180780-5-michal.wajdeczko@intel.com>
X-ClientProxiedBy: SJ0PR13CA0147.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::32) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DM4PR11MB6381:EE_
X-MS-Office365-Filtering-Correlation-Id: 82985adf-18ac-4948-f20d-08ddde739545
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|27256017;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ivbk3bMLpIkENfeXVrNvGxS1Dtk1/c9w6CyAw5Y1Mz0iArYmIN58f2kWc0TU?=
 =?us-ascii?Q?A3RxQlW1sUF5ehMFJw0rTKXNTge38ABInC2AKFtgKa7ZUOcU6hI3REuw25Uw?=
 =?us-ascii?Q?TpPACBBeI1zjS47NH/X3bJ7EyzLPL9jdxMbY+c8wr6JqTDQA+DqFUXmJt9V3?=
 =?us-ascii?Q?cCb7pSDyVv2JtFaIBnd/cFbuPZ5CCYrpZJoYbs3BcieSLAvjqkhS/Hd+PZ7X?=
 =?us-ascii?Q?DKwN/LSS96iP9M7qNJYyF35dwHSSGWKGxJ7qQTtKio/N86TIj2rblfKCYa0T?=
 =?us-ascii?Q?xNXd2Y0dcr3y1eZRdqUUqp6wEQcTQNpSEzSvfOMthCJ1INdE9mNFtb3rqUk1?=
 =?us-ascii?Q?vTzwbAcG81nyxM3ApCQd/UHsnzLFjX9cgjz6oFLnHQ0ofVNjAWaKNcSekZSP?=
 =?us-ascii?Q?sesKPeVc03X5kAu3DdCnf1qD1LjO+jE7L3inBZCUqfeSI7kbJtw7FHvgmN03?=
 =?us-ascii?Q?64eND0zXZYGLysh9R5SsAJRprw3JiPlKN+jKlG1/VjvTZDJSbZ1CWPY3dH/e?=
 =?us-ascii?Q?KubRm7bcy1VCWWvSlt1esl+8azjZAWM3+DEif8NnRcXKVEbmSglnAIZ+SVc3?=
 =?us-ascii?Q?Yf/xC/C5aQ1M2E3tkdeXy2VlIT09rvknE0GxOAXxdjH0U4lalau6KV4xRw1h?=
 =?us-ascii?Q?24m0RgW3OOsOzEW3Mnn3kmgzPG5crZEEx+O756R2j8QQRwpQmlJiGFuMBT67?=
 =?us-ascii?Q?g+++L8soqu0MCBavLWHUMA8kL2GQhVwJFPbaI6uiIz5x0pWYRX5wC65d+SM+?=
 =?us-ascii?Q?9meYPvxBPCn4+jZffvmLRzCpHbc9DdY50gqf6CvWozT7/Hdp4Xckq5R7JCSh?=
 =?us-ascii?Q?XD0cI3/bOMpJ+YV++OWZf++hGFdS2DrFtAWDPfy7aOPMYKF7kUb2riHyt8wL?=
 =?us-ascii?Q?e3O9P0ay27m8UrxPkSVYVEyOtXbWgNoA/iMa1wDtRarc5NSQpGfEvxPWIEbs?=
 =?us-ascii?Q?7NJXH3+KEn3vIQ0CilwPcyQs5fYR1QDj89rwKjVxyiH9+4jOKlf3FwiknqZt?=
 =?us-ascii?Q?D3UKlW9GIKO5Wf7q4elrUphm1nDvsxewHSDv7GEFryqqXxx1k+xuRnpYp5im?=
 =?us-ascii?Q?ImoGCWzbiKKw1Zwqin0zhYtK1/jz3kDrgXwHeAV1FWOjRwmqtx/uYCnUgOQQ?=
 =?us-ascii?Q?QU3wf09RpcYEqvIcc9qqfMHOEzX0GDyDsc+PC03hi4GdmUFZIXDv+cdZnia/?=
 =?us-ascii?Q?un2rRV/mymqjTo3gLApWQhtvgbCnkxXlOxETKcHRBRKgyNsM7pg30OKwUIE8?=
 =?us-ascii?Q?8HSHan83BOBLJDUjYIXKs2L/s/Z3g87wpBGlAsd475R4NV7x0c9tsn83rAx2?=
 =?us-ascii?Q?+Z10f2JgCT06lfL7fodsd/2KA4g74cFd89nIxN5CkOoq739zZwoDkQX8C4AY?=
 =?us-ascii?Q?hbPEOxB0H5HzKwE4yqcXRt+rol1rQjrPVfUOUFazrctVcZoWia/iucOPXWis?=
 =?us-ascii?Q?i8SH1E3LZQWDWckqt/ZavzBsGBQy2lW2+eTc0LFn4s+zPeZQD3GFYg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(27256017); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?rAvnQzIDeM/stiKrDjMgAwiYCqp5wcWgyWV5sAszUw1b2sknQyr0gIkRdrTZ?=
 =?us-ascii?Q?1sbrr8Nm5S7gutUGgUxTkYxeeHivgDF7YOvudKqtBdrEDkmyZIrnIIInJCHE?=
 =?us-ascii?Q?HTSJ8fz6oP7pmDKx8+r9SRF5yaM0yOQ9U5i13BANoQALqm+Qcilia+YTd98g?=
 =?us-ascii?Q?W6FwRR+Uo1B/Tg3pXVSYXvW2hFEFWndmMAWTanRwLj150yRbOwM9k4I+4V04?=
 =?us-ascii?Q?NYh/MSmJ4McCDU9whU/tbAKsDbeH0s6epHhUrGx9ueGnlePqVi3m98YsVGMF?=
 =?us-ascii?Q?QMhhui8JcjO4a7EJ4gW4D10ySRsq6DVDlJN1a3N1iVt2iepjl4+NXYRUont2?=
 =?us-ascii?Q?wjMecHdNWWmnlZuONere8htk99LbjWwOKyKUvmgTNQIUVC3VmSb2hWUAZNBW?=
 =?us-ascii?Q?I7HbwW6QtLM0ec2n5UiMRTon4+oMKRB9iSxB5S4qQ4dht/ctKqzlP7sc22+F?=
 =?us-ascii?Q?WFoMo/CRZKuUdLFZ5Fwikdd7fUCw5FCbckTwSn0oE+PHzGWGvevlGlPhzVHj?=
 =?us-ascii?Q?SDYnvuwggOf8FFboFeJZ/otJxO2K1LZoNcYXpN4Lt1Cl4riO7GixeGgUcsRV?=
 =?us-ascii?Q?VyQYjJMaamsJCOka/R7+/6XyvvjtLrN54mQmlx6EIH5sHoWkaE/yR3twISPu?=
 =?us-ascii?Q?v5rJaR9PvB/c85soSjhF53eWcup9tExTu1GkGka2Ln3PlOD8GF5BYprSEODH?=
 =?us-ascii?Q?yXxbUV6A8XLknwKm2a8oYsJpQb5FYayQQ5fAXWpNrWOczvBBPRsqr2aAaf6Q?=
 =?us-ascii?Q?dcWw0FazS/lhWe+8Be+UaakXWa8v+1NyrsH7KHTapGNVNpeFnOviiH3sVDL9?=
 =?us-ascii?Q?WSxqwAe4Gu7EW50Xs2VnJQiXi8/K/pO1MmWH0TA57kjjP6ETkKQIv2M0GK9w?=
 =?us-ascii?Q?64RKssR+52OBPuUNHbf3h9Yjcf2WsbGyoaXq1bU16AKf83aOpOQIL742qDMb?=
 =?us-ascii?Q?F+vjHCGcMdhYj/2UkGQUsH7J4pwGg46yHMectwoTMcBP69esNsEdgQE/XkGy?=
 =?us-ascii?Q?XmaqhOFfpLUVjk//TS6hpyXq7C7MtAHJcH3Wbfl7n95CRdds9LcnCmpEAfuT?=
 =?us-ascii?Q?wmzIbekyp09t1QllMptuncGVvScBKGyg0nSmbF6GZP54ALz9s+oQ9MIng4LA?=
 =?us-ascii?Q?a3YtDkkv3toOT0bcsfN+X6/c8rsNGBSQFrXueAa9CKaMaGnQyMJ79bEXqNlX?=
 =?us-ascii?Q?LYlWTMBvF/gJCPBA3fYhG646/dimAoUNjQmQaNRSF+/XjKUTorBL+4/sv6XZ?=
 =?us-ascii?Q?ybeDmrDEXwXzuVyG30KDgduN/3pUt36NhPCAjYpJJpuCe2W2reeDhjONl6bo?=
 =?us-ascii?Q?4pBXXTTzeWW2c5tREyfy0sbOYamd1AgkjuAc8SCKVqYKLK2LMz5jXfeOMeDz?=
 =?us-ascii?Q?dRTynADVWQAmZNpxpRJ9vEE0fAJWJ0/hgS8+VKICnJ4Lf0X/nEsrnjH8PIGe?=
 =?us-ascii?Q?WTSma4YPEeZvLkLHjjMa347z9wARHiaOLDLZweuvd9r00RqzTjvRgI0v2Vck?=
 =?us-ascii?Q?MiCSEINvpzuB1Kn/cB+oIbZaplP1MN4QKn+Zm+nVnxIm9yQMVn+ywuS1Iyrd?=
 =?us-ascii?Q?g0HNoTEXVGWot9qWPpDKgkuHTUlLAL2h64VUBOe3/ULGrUvkvIL8ZbwQNm/o?=
 =?us-ascii?Q?nA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 82985adf-18ac-4948-f20d-08ddde739545
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2025 16:23:36.4635 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SV+cKeAVdMNPBi5atLNz5pvJ6bWU+NNk9l8VqyysqcdFVt0oAfT1EQPAb2APVfXjnA4bNh/EmcnEKUuLlLPKVa+JH1UQMVCPnSFri7x6NUs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6381
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

On Fri, Aug 01, 2025 at 08:13:48PM +0200, Michal Wajdeczko wrote:
>The list of all known representative platforms defined in xe_wa
>could be used in more places by othere test suites.

				  ^^ typo

>
>Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi
