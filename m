Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CFC8CA0EC4
	for <intel-xe@archiver.kernel.org>; Tue, 12 Aug 2025 04:47:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EA3B10E03D;
	Tue, 12 Aug 2025 04:47:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="d5OI898r";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C8FA10E03D
 for <intel-xe@lists.freedesktop.org>; Tue, 12 Aug 2025 04:47:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754974058; x=1786510058;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=AdjirYOFaHA4Occ1eGEWSHQTxyiGdvMmuJpetHlrGWo=;
 b=d5OI898riY1VSSKHQYcMXWErfAu5MxvP5MKmMWeXMK3TeC37s+BTMlLd
 xt4AKCJHssLlewZs+xpCIvGD6gYghq+keATWPsrmK9Q/8XTWwSisQlNEa
 vK7CmnWzlCt0yDO5UdHVPdZjeN2Qr2BBE7mciqMwXU31pL4439GauMQad
 PXKj5aOE7QFbpthJxasbetQ6RHpRdl5kyHNRR8Ddi4P5X/wK1lnBe2Qjc
 Yn08SQ59zetcKBkbsJpIuku9pS0vI8cmvG/17gP6JGQ6fS/7elOtHvaf0
 omIOWyomFO7+R8vfnfB5dOPLgama/UqVhRB8v7+VTmVGwh+omkKgYWR+q Q==;
X-CSE-ConnectionGUID: yIcKFwbrRtq2SDAu95UPvA==
X-CSE-MsgGUID: QWBRa7aJQgqtUzhs8DNbqw==
X-IronPort-AV: E=McAfee;i="6800,10657,11518"; a="59851192"
X-IronPort-AV: E=Sophos;i="6.17,284,1747724400"; d="scan'208";a="59851192"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2025 21:47:37 -0700
X-CSE-ConnectionGUID: ZDVhRayvTJyUOQfQVUPCDg==
X-CSE-MsgGUID: uRt/g8VDQduqonPw7CuTXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,284,1747724400"; d="scan'208";a="196939837"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2025 21:47:38 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 11 Aug 2025 21:47:37 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Mon, 11 Aug 2025 21:47:37 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (40.107.94.65) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 11 Aug 2025 21:47:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Gi3oRQlOeADGZtfXTRwGPKkaxJjhD2yuRT9+W4fj6IASSv3SQU3/GFZpu8tFhaCUfibGomUnvVBEKAKXlAATJAF4fFTKEHAw1OHMMAEdBubRF2SdNMsTjmcE0f5Gzbl6XVhjZEsKxA1dNLjCk9Lpwyipo5WVVVjhmQ91DaNupxsqoupY0x02I+NRfFiC6MqTudtckQccZdSXhu83p8ApdmEm0gq1TLgu1kXwlLluS0BhH3w4b4ph3ZXoBDY/fvD6dchJcyBpHpU2YxAMBIqumYb/zercN5HQx+1017/XxoiMKCpXwkPL4IS/+nXq0PSey5aXQODotggp+03jLVE1HA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9nco+pl4BJfTRF7ybgyRzR/d3X9u7PE94cFij+Yy1v0=;
 b=nMWkDCxI+YMufG8KEzWK56uQ5rkzYUM42FgeQmLI9iV0RRhmXIux1EtF9tBED9hjEp8ISS7Rc7c6d7VBJXZDHizUl1G1iInGPvrOtCwdNcRXHQ9Rw1N6rrWF54LuOqqxHN+DHF+jvjFsH5CVdUiGiWrBxNe5xzjS9gEzHpeXtYiRRkkIlirdEcrq/cfff/YEL/0bCHIyDE2ifIoqTgqdNzxAYtn5QkhafDvUwi2UpkqgBo7ox5RxMdymkk8cDkv4BX/R5/cZs/cSOxasjFsj/W8FHk7oqVxGL/tbTBnZZfJL5E1NFOJXAeHn+OSRDrM+0e4CHL4QopXPwJrYkRotZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA1PR11MB8326.namprd11.prod.outlook.com (2603:10b6:806:379::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.21; Tue, 12 Aug
 2025 04:47:35 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.9009.018; Tue, 12 Aug 2025
 04:47:34 +0000
Date: Mon, 11 Aug 2025 21:47:31 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Tomasz Lis <tomasz.lis@intel.com>
CC: <intel-xe@lists.freedesktop.org>, =?utf-8?Q?Micha=C5=82?= Winiarski
 <michal.winiarski@intel.com>, =?utf-8?Q?Micha=C5=82?= Wajdeczko
 <michal.wajdeczko@intel.com>, Piotr =?iso-8859-1?Q?Pi=F3rkowski?=
 <piotr.piorkowski@intel.com>, Lucas De Marchi <lucas.demarchi@intel.com>,
 <thomas.hellstrom@linux.intel.com>, <rodrigo.vivi@intel.com>,
 <daniele.ceraolospurio@intel.com>, <john.c.harrison@intel.com>,
 <jon.ewins@intel.com>, <kimmo.nikkanen@intel.com>, <luis.strano@intel.com>
Subject: Re: [PATCH v8 0/8] drm/xe/vf: Post-migration recovery of queues and
 jobs
Message-ID: <aJrHY+xO+01Fd4gm@lstrano-desk.jf.intel.com>
References: <20250801015045.957609-1-tomasz.lis@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250801015045.957609-1-tomasz.lis@intel.com>
X-ClientProxiedBy: SJ0PR03CA0080.namprd03.prod.outlook.com
 (2603:10b6:a03:331::25) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA1PR11MB8326:EE_
X-MS-Office365-Filtering-Correlation-Id: 9dee2a82-6251-4b2f-06bb-08ddd95b5aea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZUY5SWZNbXlWQ3FJMk1zSXpDWXhOMHVNMmFBQUJXb2ZoMzJGVnFpUE5sOTFo?=
 =?utf-8?B?U3FZTVc4M2xHa1Y2QjZtMnlyS1NBbXlIUHJIdzY2R2REaE1tZ0hJVzFwM1Mw?=
 =?utf-8?B?OUx2UGIzbnlZbzJMNHNkeXR6ZWZpWVl2dVZFTkZtTWI3eGtVaTNHdDdNanpJ?=
 =?utf-8?B?MFAyT0swRXh1RU1BUk1haGxTZkRoTklvdGJ3WVdyb3ZEQnVWUUMxM0NncUlh?=
 =?utf-8?B?MnhYL09xYmdoSzdkTXNETFZXWFhkcmdoSHJwaFVUNXpuOENTU1ZqajVGL214?=
 =?utf-8?B?ekpKdm5HS1JZa1BJd3M0c05scU5PalNrYU91aVdIZHhUWTFpWnZGVEg3QzQz?=
 =?utf-8?B?NGdSd0hGakdyR2hMV2prbWMrR0RkWkUxalBxVmtVazVsbFA2YlkzaDV2cTBr?=
 =?utf-8?B?S25IVlhpVWFFYWxyclY1UlRyU0tsd0tlN2JMZDkrVFZMRzdyVjRXR1NwVjM2?=
 =?utf-8?B?dDdncmhGTHNrOG1kM1hkOFkzT0JDK1huU1hzM29kZStrdW5Vd2t0ZVo0QWw3?=
 =?utf-8?B?VHIvbG45K0tjN252Tk1XNXlpUUJpN2VIM3Y5L3ZxdExlZkdJU1Fyd2NGbHll?=
 =?utf-8?B?c1B4VW9ybjE3VTBoZ3BCWThVZFppcmwyTkl4aGhxK1Nsb2VscExhZmFKakpZ?=
 =?utf-8?B?YzlMRnhyd0twWjVHT3crTk9xRjNhZzhIWno5MUJnTVIrT09LZkJ2d25yZEZZ?=
 =?utf-8?B?TElRZTdDQlBIMEpONFFYaUVuV2FoV0V5ZElPNmxiQkJWbTZPSDkzY2dwYk13?=
 =?utf-8?B?Kzl1V1ZBVDlCL2k0ZlljclhiYmRQSElsa2taWkVDdTJ0cWtFQzdvV09lRFJS?=
 =?utf-8?B?ajlRSjVuSjVzZ2dZWmJXend5WDZvaDdwWGZjUnY1WENieW1GRkl1d0cvQ1NW?=
 =?utf-8?B?YTg4eGFWcWF4ZjdUZkpIOFJVZ2ZJSU5JbVpreUl6akR6VmZPcXZhbXJ4ak4v?=
 =?utf-8?B?ZkdoWHp3NjFJRWN6RFIydUpWc0thUEtNTUdzaUtkekloU0dha29xdXR4M1Zw?=
 =?utf-8?B?RWFJRnF0ekVmOTQ4emwyMFhGbFVVTDRibWlSNjJtVis0QzlWVGwvdkRheDRM?=
 =?utf-8?B?MzRWUGJraGlweWRScDFpZEhQWkFSdGQxNE5YUDFPaTJmQWlkR1JISFdXNlMx?=
 =?utf-8?B?SHJETlI2TVo1WW9XV3EwVm0xRFVZd3FkRlpsK0ZHUE4wN2wvRjZFbHBGM1du?=
 =?utf-8?B?bjJYNWR1Um5DdnRSK29rb2xra0RJQ0VwZlRnUUtOVDgwTHR0VkpVa29Ud0pS?=
 =?utf-8?B?VUFneG56UXc3RktEcGlxb3E1RjJwa0tMODRJaXRhZkZvbk1tVlBGTnhQYi8z?=
 =?utf-8?B?eDh3MlFxZG5ycit6aDlLaFhLYjM5b3c4SUN5S25VOFV0QXBuMUVSR2VBUWVG?=
 =?utf-8?B?VjlTNVdNVmhoWHhtcTBxc0ljUWdqcU9JdWJGUjBod2dRWUw1YzlmODI2eCtw?=
 =?utf-8?B?eTMvaFVqTCsybnR0UTJBNW5LeE5ZN2lma3EvN21kZG4zdmRsNjVla1pOeFpS?=
 =?utf-8?B?LytKT0paNlZnUFFZM08vM2Fya1FvYjVDeFBJM0sybUYwaVlyRWJHQXZaelRp?=
 =?utf-8?B?RFFlaVJtMFdoSjMyeUNqM0pOZTZnNG9nU3hKNkdnQkhoUVpsQXpXUHNjUmdB?=
 =?utf-8?B?Z1U1cWdQRHAvY0V0cnpZSExJTDdaamFXQWtKSFJTTWMxSHpPcFJSWDBMck1z?=
 =?utf-8?B?a0dNMEZ1UjlhcUVpUFhwYytXM2ltcFFqbGRHMytGOVRJZUc4VjF3K2UzZUpl?=
 =?utf-8?B?S1JtRFVXWE1PaEc2d2sybjduTXYwb296VFVRTnY4Rm8zLzNhUGFpSVZuUjhK?=
 =?utf-8?B?ajdkZlIvRG5GeUtMWnljSloxV0NJd05DbHQwSmZGYU9adjBKQ3NqN0JNYlNM?=
 =?utf-8?Q?YuRwSFl3b5BK4?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dlJUeFFxaEtqYmR2MkpqZ3RLMWd0RDBMMEtmZXpDOFYyVCsyRzVIRjJtMnFK?=
 =?utf-8?B?N09RaERHZjVJN3pFUVpEdHF2ZFJOemViMVVnajRKS2toam8wNlUzTklzMDNv?=
 =?utf-8?B?QTVqZllrK1JLQWd0RnNza090RXV1d2VWOVdrdkh5NnFzbVcxdTNFcXI5bWRw?=
 =?utf-8?B?c1VBbTIwMDhpeUYzNEtxM1FNQmpWVFZaYlhGckN5Q0tjeVNTaEIzOWUzQ2J1?=
 =?utf-8?B?djQzMmpiOGZhTTRvSjZxQzU1Q1dLcCt1c1hsZ0FHMmFpWXdrRzhmR1EwN293?=
 =?utf-8?B?elZPUU5WL2w2cStCWXljOE96Vkhqbk1tb0VzT1ZHSEJBRkpaU3VJZG8yM0Qz?=
 =?utf-8?B?eURlLzdLdnRlRlgySFkweHdLL3FOcjZQSnFiM3JhRTUwYldibGUxR2FOY3Z6?=
 =?utf-8?B?MVdPZE1rYXY0T1F5Uk1BRENaRTZQU1o4Y2gvaG52NHVlUXl5ZHBGcGZzeG9O?=
 =?utf-8?B?WU0rdWFYcXRBWmllMmRhajdUVDVKWjV4T0c1K3ZHNTFPUC9FVUgrOXRKNXVt?=
 =?utf-8?B?NHAzTG54OXREbXFJNVdrRFNwTk15LzRmRHpuSXdCbW5TU2h4OVY2dWJPOFJv?=
 =?utf-8?B?UE1vbjJPTTRUZXI0eHJUcWdwY3QxY0R0T1ZEd0RBdkVJWjljVklRSmRhZnVy?=
 =?utf-8?B?YUFUdlBnd2pQelU4TTI2NHk1Ujl1WHowYnZEc0lsbzdGMXNJWU5Rc0dCdGQ5?=
 =?utf-8?B?T2tOVTVLUVUwQTFYRnZoYURJdEFHT0xMakpuM05PYUVPSjZCV2ZLeDNyY2R2?=
 =?utf-8?B?SUNDT2hJRENjVnFsWldqOUVNLytZYk1qSjJzdU90YXJsdVpYS3l6aUppdXdr?=
 =?utf-8?B?cE1Jb3Z3NUV4TFI3WFpTT2JpYnlLeWN0b1dDazRYekdxeUhuOFRSUU5JKyto?=
 =?utf-8?B?WEI3LzJXVnJySHNjU3Z6cGYxQURXUGNhVGZURlFJYTI4SFF6ck14MHlQSlJY?=
 =?utf-8?B?ZnhVT1Jwc1NWRnY0V2FPZkFlVjVMbXkxTG9JQmtmU0JyTDg0V3M1WEwwYWhv?=
 =?utf-8?B?TERFK3ZqZ1VmZzExVEZYQ2krV0xKbHJOb0lSYXZMUFRWYXkzcnBrbTVMOVZK?=
 =?utf-8?B?ZHhvejFmdGkyanU3RGJDdHNFdWdQREJxTUh4NTFQeElqUExmN0Y4UzhzbC9n?=
 =?utf-8?B?Y0x3eUhva2FkVkxiMnIrNWJxb3BaVFkxWU5SWm9qRkZiaEd0N3hnNzk1MlhL?=
 =?utf-8?B?S3grbit0UUlZdGIzODVaOVJlWFVOS3VwVXJXcFF4V1hBSjRNT3JrTk9INDNY?=
 =?utf-8?B?ZUZCVVhpNVhZY3ByVVNZbVE4MHhTb3BJRVlCT3dlNXNIdWJMUTJxb09NTFJE?=
 =?utf-8?B?Sm5OSUhya1gwUXFJU1JBRlNaazlwWERJYTIwRmdjcUxjUlJGakFPdHE3dnlG?=
 =?utf-8?B?cFBVcVZwNHBCbk91ZkN2aWgvalFMU1hwTE84Yk9iMW4raTMrZG1UQXRiU0tN?=
 =?utf-8?B?aFhOVHJ0VE1QbVBCdU5WR0Z4bkFXUGp1ZE9CYzhSRityclhFSDQ5QnYrZCtB?=
 =?utf-8?B?WUoyblBmWmcwZ2ZkK2VCcnZRUlFneFVRb3IxRTNYZHdQY29RSFAvaU8vU0J4?=
 =?utf-8?B?OXJsMFNvNGJjOVlDNm02YnhraFJSSDVUeUg0a3BodEZYNW94bTNlS3c3Ukxq?=
 =?utf-8?B?OUQ2Tmg0TXV6RnpycE9SdEZDWWtvVVhuOGthMFZDdDlJZHVvRENGaGRwQ0hX?=
 =?utf-8?B?UXJjZVZjUytvUHFyT25COWE3Q0d0ckF4RVR2clRDT0J3cFhtcmI3VFdJUjZI?=
 =?utf-8?B?RHYxNXhMWjQ3cUFNa0RaQWp0VzRLUmROQWdwNFRvVjVRYnlBbUZ1VEZQZjRF?=
 =?utf-8?B?Q3pFTDZhVGxvYWFZd3BORmJKVmFPSWtCQ0wxOU9zVDlYTHhUbTMyQy9WOXdK?=
 =?utf-8?B?OU1RQmRaeFlEK081TTR3Ni9KcDc1bFZGYUxJTG1YdUZ6aGpuajViUjdRWXp3?=
 =?utf-8?B?WWM3aDNiSmNYMVZ1czZyZTJSTVFRRHlsc09BbFQwbldlemRTNlZ1Mm03eG4w?=
 =?utf-8?B?MFFQTlNlY2ptNVVIL0pLWU56SUtJZk1iS292d3B3ejFQK0ttVGFpRkRZQ05x?=
 =?utf-8?B?RW5vSi9FdXJWTWVYKyttcXF3R0E2M1dWOFhQUG5sMmxIZkVrTUpFWGt6Ykk2?=
 =?utf-8?B?Qmw5RkRVWkkrMkZMd25QRWRLWm52dHpFZ3N4SGNGd2ZXck4zNVBzalFLNXN2?=
 =?utf-8?B?emc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9dee2a82-6251-4b2f-06bb-08ddd95b5aea
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2025 04:47:34.8515 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Wt6v0DRdbl84kkEe5dns/jydXMnYBMwl+kVHQS734zzg+tvj/M8BPLY+RjzAYMlNm/y7mf9ubvtyiNH15KqF+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8326
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

On Fri, Aug 01, 2025 at 03:50:37AM +0200, Tomasz Lis wrote:

+Maintainers, public, consolidating threads.

IMO this needs to be fully reverted or at minimum a subset of
problematic patches, along with [1].

To start, it was brought to my attention that this code was not tested
due to a lack of internal infrastructure. I believe it is completely
unacceptable for untested code to be merged, especially for a complex
feature like this. After spending some time reviewing the feature, I
found clear bugs, and the overall software architecture appears
ill-conceived.

Quick overview of bugs / issues I have spotted:

- xe_exec_queue_jobs_ring_restore does not modify existing ring jobs’ GGTT
  addresses; it instead populates new parts of the ring buffer. This not
  only fails to accomplish what it intends, it could also overflow the
  ring buffer for existing jobs.

- xe_exec_queue_jobs_ring_restore has clear layering violations by
  reaching into q->guc state.

- Upon VF resume, nothing prevents new submissions from writing to GGTT
  addresses that have been moved. I was looped into this by internal
  patches proposing an untenable locking model, which IMO is non-viable.
  Tomazs please post those publically for reference.

- During queue pause/unpause [3], nothing (i.e., a missing mutex) prevents
  a UAF during the queue lookup in submission_state.exec_queue_lookup.

- xe_sched_submission_stop_async in [3] is not actually asynchronous (it
  synchronously stops the scheduler workitems). It also doesn’t prevent
  queued scheduler messages (driver side workitems) from being
  processed; those may send GuC H2Gs over an inactive interface, or wait
  on G2Hs that will never arrive because the CT interface/GuC is not live.

- xe_sched_submission_stop_async relies on GuC CTs being alive to make
  forward progress; otherwise GuC CT timeouts can trigger a GT reset,
  which by nature loses state which opposing to this features goal.

- Even if xe_sched_submission_stop_async were actually asynchronous, GuC
  H2Gs have bounded timeouts, so H2Gs can be lost. The submission model
  assumes H2G/G2H are lossless or that losses are recoverable by
  inspecting stored GuC submission-queue state (as with GT resets).

- Modifying GGTT addresses via CTs [4] or GuC WQs [5] is fragile. Any
  interface change would likely break this, and any new interfaces that
  use GGTT addresses would also need updates.

I purpose this flow instead, which TL;DR is modified GT reset flow which
understands GuC state is not lost, rather CTs can be lost.

- Before calling xe_guc_submit_pause(), stop the CTs and drain/parse all
  pending G2H messages. Parsing G2H stabilizes the GuC submission state;
  stopping CTs prevents waits on disabled CTs and avoids timeouts due to
  lack of space.

- xe_guc_submit_{pause,unpause}() should take submission_state.lock and
  flip a bit in the global GuC submission state. This bit blocks all new
  submissions and causes any waiters in the submission/message paths to
  exit gracefully.

- xe_guc_submit_pause() stops everything synchronously, including TDRs.
  This is required here because TDRs are scheduled on the same
  single-threaded, ordered workqueue. We may need DRM scheduler hooks to
  facilitate pausing/resuming TDRs.

- xe_guc_submit_pause() scans the GuC submission state and makes any
  modifications needed for replay (e.g., adjust internal state, reset the
  WQ head and tail to match, adjust LRC head/tail pointers to match,
  etc.).

- Scan the CT buffer; convert anything that touches submission state into
  a NOP and adjust G2H credits as needed. If the GuC lacks a NOP, we’ll
  need to add one; alternatively, if feasible, we can discard the entire
  H2G queue, which would be simpler.

- Adjust all GGTT addresses of non-submission-related objects.

- Restart the CTs and enable the VF in the GuC.

- xe_guc_submit_unpause() resubmits everything through the scheduler, with
  ring-head pointer adjustment similar to [6]. (It’s possible the head
  adjustment belongs in pause; I need a complete picture of how the GuC
  replays preempted jobs—e.g., if the return address from BB start is an
  exact ring address rather than relying on the ring head, the algorithm
  would change.) The resubmission will re-register any queues whose
  registration was lost, re-enable any queues whose scheduler-enable state
  was lost, and resubmit the correct WQ items.

- xe_guc_submit_unpause() also replays any messages that were in flight
  but lost due to VF resume (e.g., teardown queue, suspend/resume of
  queues).

- xe_guc_submit_unpause() restarts all scheduler work items, including
  TDRs.

Matt

[1] https://patchwork.freedesktop.org/series/148780/
[2] https://patchwork.freedesktop.org/patch/666681/?series=148982&rev=10
[3] https://patchwork.freedesktop.org/patch/666679/?series=148982&rev=10
[4] https://patchwork.freedesktop.org/patch/652446/?series=148780&rev=1
[5] https://patchwork.freedesktop.org/patch/666683/?series=148982&rev=10
[6] https://patchwork.freedesktop.org/series/152715/ 

> To support VF Migration, it is necessary to do fixups to any
> non-virtualized resources. These fixups need to be applied within
> VM, on the KMD working with VF.
> 
> This series adds two fixup functions to the recovery worker:
> * for fixing xe_lrc structs within queues
> * for fixing xe_job structs and the commands they emit
> It also provides some performance and stability fixes - blocking
> submissions and resets while the fixups are being applied.
> In case of sub-allocator, it removes the cached GGTT addresses
> instead of implementing fixups for them.
> 
> v2: Switcghed to update of addresses by xe_lrc_write_ctx_reg()
>   to avoid kzalloc(), renamed or moved few functions
> v3: Renamed and reordered parameters, added kerneldocs
> v4: Take job_list_lock, introduce a new atomic for reset
>   blocking, add "refresh utilization buffer" patch
> v5: Replaced "Finish RESFIX by reset" patch with "Skip fixups
>   before getting GGTT info", rebased "Refresh utilization buffer"
>   patch
> v6: Rebased to changes in "Make multi-GT migration less error prone",
>   used a scratch buffer, and added one more ring recovery patch
> v7: Used better matching atomic functs, fixed noop item at end of
>   WQ ring, added more exit conditions in wq ring
> v8: Improve error/warn logging, add propagation of errors,
>  make enum for offsets
> 
> Tomasz Lis (8):
>   drm/xe/sa: Avoid caching GGTT address within the manager
>   drm/xe/vf: Pause submissions during RESFIX fixups
>   drm/xe: Block reset while recovering from VF migration
>   drm/xe/vf: Rebase HWSP of all contexts after migration
>   drm/xe/vf: Rebase MEMIRQ structures for all contexts after migration
>   drm/xe/vf: Post migration, repopulate ring area for pending request
>   drm/xe/vf: Refresh utilization buffer during migration recovery
>   drm/xe/vf: Rebase exec queue parallel commands during migration
>     recovery
> 
>  drivers/gpu/drm/xe/abi/guc_actions_abi.h |   8 ++
>  drivers/gpu/drm/xe/xe_exec_queue.c       |  48 +++++++
>  drivers/gpu/drm/xe/xe_exec_queue.h       |   4 +
>  drivers/gpu/drm/xe/xe_gpu_scheduler.c    |  13 ++
>  drivers/gpu/drm/xe/xe_gpu_scheduler.h    |   1 +
>  drivers/gpu/drm/xe/xe_gt.c               |  10 ++
>  drivers/gpu/drm/xe/xe_gt_debugfs.c       |   5 +-
>  drivers/gpu/drm/xe/xe_gt_sriov_vf.c      |  14 ++
>  drivers/gpu/drm/xe/xe_gt_sriov_vf.h      |   1 +
>  drivers/gpu/drm/xe/xe_guc_buf.c          |   2 +-
>  drivers/gpu/drm/xe/xe_guc_submit.c       | 175 +++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_guc_submit.h       |   9 ++
>  drivers/gpu/drm/xe/xe_guc_types.h        |   6 +
>  drivers/gpu/drm/xe/xe_lrc.c              | 107 ++++++++++++--
>  drivers/gpu/drm/xe/xe_lrc.h              |   9 ++
>  drivers/gpu/drm/xe/xe_sa.c               |   1 -
>  drivers/gpu/drm/xe/xe_sa.h               |  15 +-
>  drivers/gpu/drm/xe/xe_sa_types.h         |   1 -
>  drivers/gpu/drm/xe/xe_sriov_vf.c         |  78 +++++++++-
>  drivers/gpu/drm/xe/xe_sriov_vf_ccs.c     |   2 +-
>  20 files changed, 490 insertions(+), 19 deletions(-)
> 
> -- 
> 2.25.1
> 
