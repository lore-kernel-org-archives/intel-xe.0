Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 446C1C3ABC0
	for <intel-xe@archiver.kernel.org>; Wed,  7 May 2025 22:42:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C48A10E202;
	Wed,  7 May 2025 22:41:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Lm7sF9Tg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9308B10E202
 for <intel-xe@lists.freedesktop.org>; Wed,  7 May 2025 22:41:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746657717; x=1778193717;
 h=date:from:to:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=TSSgcIZc60LkEWDByVx2XWzRu97jlOM5nKrRy972KkI=;
 b=Lm7sF9TgEXsTos0G3R5VK2P+ZemDLhWQTfWJTyzI1UyUrxCGWOKRzOlz
 7lSCUc3T/TqFHbAUGXHSkXcsWibiHSvlvpuDDCnzR9Aq99On+QLsrU2Iy
 +Ysj4T2UHzJELP80Kfjq+6TMUOJ+4lyr9X6fkTfeSh3pX0JjeO5jNH9He
 YzzieP8iwqbsSXvUX2ASBNs3HeVMDt9msO8Pb7XBksxG4kwdE5zhe85Ce
 BHp7KEVo7uZ0z6ezzqCo0NWcheAjcY0xRuHOQWeMJPFBCiZoHrlDVjGHr
 hGqriYSa/zRV8/AwqMjh0I9ZMqMRkCptN0Z+Ymd6RrrnVCIwnKCevGec9 w==;
X-CSE-ConnectionGUID: 0Q64gIUqS/+X8N3Ox5cFtg==
X-CSE-MsgGUID: 9xyU3TsMSl2NMibUFHDq0g==
X-IronPort-AV: E=McAfee;i="6700,10204,11426"; a="52069427"
X-IronPort-AV: E=Sophos;i="6.15,270,1739865600"; d="scan'208";a="52069427"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2025 15:41:54 -0700
X-CSE-ConnectionGUID: NNsfdbrmTaq1D8YpoaCmdw==
X-CSE-MsgGUID: 5nj7C8I/R3qx4weIEiQRxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,270,1739865600"; d="scan'208";a="141221375"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2025 15:41:54 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 7 May 2025 15:41:53 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 7 May 2025 15:41:53 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.44) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 7 May 2025 15:41:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PnueUSyoDN3WkR/WWAxp6a45eiLSPH5F/xmqUhmDBmoN8FDPL6i9pzbCx5BL8XEVgzVXnVCH7+b9XeIVjHPjA9fODrkI+xtra/imuO0ziTQ0Xnmyie8S7WMpzI2X+RyQDuYh06hE6UjyPwGPdCi4kkz65qXsexhDQwRq8LMQ0dnZ9/+JQOMMUhgqb5YM/n39hxhfF0JZbrkXrUPUuPL9tb9O8eUgeYDniuQzHk00zQhYAN8A1PmgzihNy21VwEbdnTaBKpORNtBPWxwxN2sg+X8HBVxjz4QBVJhfOVKSOHpVHhbAGboqU0by4FwPbp7WpBqQeIzK6ZXUdSxhY5Y7jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WbrxTPA7YwDVgQnmPFuNnY1XNsD/Ad0NqE5cmqEa9W8=;
 b=U9mhz3eiY5GNu4YNvlrxwigzm0SbLvPI5400R8WhQ7aY9KBXbhctd/rV3cmqewphHM7C/dd7RZ/Btag7Xy/SEA2OYge8pwi3t3Hy56HCwa0I8OK9RBkkaJWbXV73A6Qqk88otm+618BDz7bBmRyspKqshWTG/hVSFhymOgMYeW6Fo+aZ4pc8hBSzu1F5n2BqWu3qLdSvGVXTGi8+CfYxG2Xv0cwQzMj3sWJOdPZQsNWE6RvGYh/vBAU8UD9ZGIjvzV+cO4REAJP6qfh1DAEInHJLkzJsVj2cDRPughK1Be6qcVNRbbfFpQrYJyoFaDfXuBD4if7GGXgs7OpXBKkMpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by DM4PR11MB6168.namprd11.prod.outlook.com (2603:10b6:8:ab::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.24; Wed, 7 May
 2025 22:41:09 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%4]) with mapi id 15.20.8699.022; Wed, 7 May 2025
 22:41:08 +0000
Date: Wed, 7 May 2025 15:41:07 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: Re: =?utf-8?B?4pyXIFhlLkNJLkZ1bGw=?= =?utf-8?Q?=3A?= failure for
 Support active context utilization (rev3)
Message-ID: <aBvhg24fTaR7y4m2@unerlige-desk.amr.corp.intel.com>
References: <20250507013039.2043897-6-umesh.nerlige.ramappa@intel.com>
 <174659060683.52693.201698946699691812@c664b1dc75d1>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <174659060683.52693.201698946699691812@c664b1dc75d1>
X-ClientProxiedBy: MW4PR03CA0052.namprd03.prod.outlook.com
 (2603:10b6:303:8e::27) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|DM4PR11MB6168:EE_
X-MS-Office365-Filtering-Correlation-Id: c76bf051-1cec-474f-4ae6-08dd8db8428f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?empDWWJWTHVZWGxpNndkdThsN0V5bzl0eUpTSGk3eHZZOU00SisyZzRTR0Mv?=
 =?utf-8?B?YmZZVmU2bEppWGFWc2ticFdjeDh2eFBGK2NzMTJOSVFUUE5vdmZsQnZ5NDFa?=
 =?utf-8?B?ZE5aNFhLL0hxNEZ0VldoMU01dHIxazV3ZlhJd1lKdzJtdTJSV0xBNndFOTJJ?=
 =?utf-8?B?cmw2c2JKb1Rkc2MwVmZIdnN0YWcxc0VaUG5JdStmSzcrdG9YV0JqZ0tzbkRm?=
 =?utf-8?B?Z2ZrbEhwOXduY1NEQ2FEZnEzdTkwYkJGKzhTODNvY0xTNEFOU1ZTWGRRVkYy?=
 =?utf-8?B?RDFwdXZQOGhSR3BKdXdVQm5vQzF2cDNraXY1czdBcit1QTFOLzZkS0pqM0dz?=
 =?utf-8?B?NUNkYm4zZHlwOGhrSWRMNTJSRVlLQkpVZnFIV2VuOUZiSzc3Q1RsQjJkWXpq?=
 =?utf-8?B?a1FuSStRVS9rYUYrUDFmK2xCZWFKZGdBSytNZGY3eDVmQ3JPWlZxU01tV1VJ?=
 =?utf-8?B?TVh1ZDVzdGhPSG1IYkxEeFVlVTR4WldFVEY2SHRtUll4ZmhGUGN4TEZ3RC9w?=
 =?utf-8?B?R1lRQi9qMm54N0Z2Sk0wSklLemNqU3djclJUL0pGQ0tSbmdpWUVwY3NZd045?=
 =?utf-8?B?bHNtVzVUWU5BcVJkYkdiUWJoeFYzeFZQNkRYMjBaV1I1RVF2eUwyUUpnNG9l?=
 =?utf-8?B?UXRlbFpTazVNUnQ3TmVSYmVabG1DdWtrV2FsZS9mL0NaYVMxaWJVWFQ1aXpI?=
 =?utf-8?B?NlZlUjJHRlhaRjg0UjB0TzVZZlRYRllxK1JaSjVlQ2ZDQ1VqM2pxblF5WU1r?=
 =?utf-8?B?YTBEK09CSnBwWkdBeTl1OEcvTDN1STc4TVdRZWp5VVd0RXJFVnlKY1ZnUENG?=
 =?utf-8?B?OVgrdU9IZmNPV05UcytCeENvQ1ZVaUxnRHVCQzFtMWhDTEtYS3dPcFJ3YUZn?=
 =?utf-8?B?ZXpzdUxoYzRmNnBvQWJJU21TYXdFYmtTV3JQWnJLbVVtNGRvekxraUlGM2lx?=
 =?utf-8?B?bFQ4OEgvZ3hRdllKZlJCeVFEUnJ4ZFo5MDNIaHdtRFowYStEeHpPd0NFTWZt?=
 =?utf-8?B?dDk1ZmVzZ1Y5TUxSaHpOQUVUalVWb2YyV3o3cmJSL0NSaHpQZEFIMTdGTERS?=
 =?utf-8?B?Uk0rTDNnZW1Mdkg0NWdnVkw1QTR2WlF3NFAwdXFUZDNoeWtyKzVLZjVCZGxB?=
 =?utf-8?B?Zzc3TVZDRDhzNDdURiswbjVROGhPc0JpZThFdFFDbzhzL1c3YiszUHZCcTBH?=
 =?utf-8?B?R1RtNWpIczhyRkI1c0JTQXZ3VzFObkFqOTRwU25oNCt6V0M4aU1mbFhEdW5h?=
 =?utf-8?B?TEFxVE1ZTWVUR2c3NnZYU01BLzA4Ukd0VzBwTExWSHNjVFJHc1ZSMVBNbDF2?=
 =?utf-8?B?b2xOSUhCNXFHS2xLeEIvcFBuSW9SdS9yN1YvOThTL0Z4YXhFNTJhYzk4VG9m?=
 =?utf-8?B?aEdzeEpscU1MRHY2VDVCZkFPT1NjV2w3SzRLUVFZU0ltYThjRE0xUmJwaXp2?=
 =?utf-8?B?N0RmeWRlUzZrY3dUVWs2UWNkQU01anlTT2x6NWVqY0RVOTd4ekdVbWVCd1N4?=
 =?utf-8?B?YkV6NHBmK25qejhFVEh6U3ZQbFlxMmlFMDJjb1pDNUl1bXZsajNpQjRWak5D?=
 =?utf-8?B?KzE2c09yRHVRamhNZWx4U0tERjNiZ0Zhb1QwazE2R3pUaFZlK2VoSm5VWVFv?=
 =?utf-8?B?SWtmQTNUOUNFNUpOOTZ0NzdiUE5jT2RyM2pwYzUxWnBaWUYyM00vNXZ4dmc2?=
 =?utf-8?B?K3dhYVJ4bG9OVnd0MHJBZmxaUVlJVkRLL29IcTE5QnFzb3lsSlRSWFo5Mlh3?=
 =?utf-8?B?K01qYTFldmFzbisxZzJoRHA3UitsSkZqcXpFMHBYUHlOVHV3UWN1b2JXNEhj?=
 =?utf-8?Q?qO/XdZX+PL+CQ0rI3fWciVLIBxeNDZv7fv2E0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WUdFWXF3TDQ3Rm5JYXhuOFJoYkh4cTRmc3lQY24xRUtsa2tveGFYZkk0NGM4?=
 =?utf-8?B?RWkvQW1sanNIRzZ0NXg2STFwRnY1L09YNGJseUZLbm0xK1d2dnlKL21HaDBq?=
 =?utf-8?B?aXIvWm5QT1pGNDRIQUR0cWI5SlFuK2tPc1N1clVuMHJQbDRnc3dCWDUreTBt?=
 =?utf-8?B?cm5VYnJ1bmlibkVaL3owWnIxN3QyQ3IxRHpESTBSamF0dTdObldrNW1sRFpL?=
 =?utf-8?B?SCswd0VmanBEbVFOL1d4QkRNa3JBeWNpOW9IU2ltMllZWm1jcFNyL1kxMXJT?=
 =?utf-8?B?SVhrN2xzek81MGhpOFJkU0RKa1k0Qlo3d2o5OXhFeVNhWTZKcVIzUHdYTi8w?=
 =?utf-8?B?ZjVBYkJ4NlpYZVlCU1NmR2hSYmhTTHN1aTN1cVlOYWYxMklUSXlpTSt2TDRr?=
 =?utf-8?B?anlYSVA4bjRXcUZyaXNhWkl1UHR6NTI5L1I0QmkvekVoV1d5eGlRZWtaVmRQ?=
 =?utf-8?B?RC82ajYzd25qSVE2Kyt1Y05iZXR4M2JrYlNaWGNmSWJ5WjVyWk1BY2YwcEVM?=
 =?utf-8?B?SkZEdkJlL1liV0pHdGMvSmpaMFB4UHBsUHBCVkNmdUh5bCtXRENVbU92R25N?=
 =?utf-8?B?Vi9YbmQ1MVBuc2RvcVEyTWljOW94RlJWVC9hQW1tNWxGNlQyRTRFVEN2UjRv?=
 =?utf-8?B?N0hhUmJLbHpZVXRBMEZKWWNnM3RjdE1wMEdJTExYZmROK3BNWlNHNWRVWW5K?=
 =?utf-8?B?cnRmaThKdCtvS242dHJLRVpRWk9QdTNKUHBZTTQyaEFleEVFbnV0QnFuZTNq?=
 =?utf-8?B?T1NsbFNQVnBvejJPTGJqdWo1S2hJSE1hdWxOTHpIcktFOEtSbitGQ2JRTS91?=
 =?utf-8?B?U1FjWkdlaGRuc1JLNVg0T1VjR24vZ2kvaGovSEJaTkhCWVlRNzRnMWFjdUsy?=
 =?utf-8?B?R2Y3RkEwa3ZacCtDUzRYK3R0V2dtbVdML245V211WldTby9FZU5GaEFRejNk?=
 =?utf-8?B?TzVST0NsZnJCeHBFNm1Dd0RZTXBzTFJtbSswSk5hZCtCZ1dDaStqZC8xYVpS?=
 =?utf-8?B?VGZPNjE0U2JTaTN6Nnp1cEQvVWltM1ZieDh1QUs1YmQ3K2Z4d09sVHFTWWVt?=
 =?utf-8?B?d3BYUVlRd05aU0FEeXUzNnNjdWRiM2IvR0N4U2lZSGlrU0NxM1ZuaFhyaE1B?=
 =?utf-8?B?ZERDKzRtTThYbnlVWS92c3dPenNLb2dBYWdFNGpYclF2WTJydUc4S3h0QVFp?=
 =?utf-8?B?SnpMQzNEOG9HTlU4bXpUUnF3STBJVGN5UlhEcHV6K09hNldnMmhxdStrb1Y3?=
 =?utf-8?B?MDRsL1BNMjVxY01SaEpNYUhTREllTlg0V2pDb2RtUjExdVJ5dnEvb2h1TzBQ?=
 =?utf-8?B?aVZUT3kyN3JiZkx4V2c4dGFkSGpJZVMvRlpyc2pmaHBRNGR5REdzQTh1ZWs1?=
 =?utf-8?B?RHhiVVVnaUxNMHUrZFNsam9aeGZwWHN4dE1qMlRoVWdlQURiZFFiN3lJL2lY?=
 =?utf-8?B?WVlTMVBNZHhOTWpJeXl6VWdBUHlsTFRsYld3K1R6YjBucUt6LzI2QzdqTFJF?=
 =?utf-8?B?Y0diYnRXaHdxb0VMWG9zK3lBbDFGcStJZTdJVmdFSDdiSFFXVlpPa1VhRUVh?=
 =?utf-8?B?VURxMGduclJXckJVeW5nNThjYWt0NEhYb0tBMVZNWGs4WEdLVkt4dXRGSU41?=
 =?utf-8?B?OEVmYVNoM3VHQW4zZ3ZCQWRHbEdXU1dZTGhPTmt3VktXWkVQb1lrRk55YVU0?=
 =?utf-8?B?MFdBWTVNZmVMbk0rTUJCUFd1TUJlUDBsQi9ka3hxV202TVBuamhVbUtDeXN4?=
 =?utf-8?B?aUlBTnQ1a0k2THM1U29hS21SZTlJQ3YwbHd6a3oyWm0xNi9jMlF2SG85dng1?=
 =?utf-8?B?bFVuZGtQWTNjb2hJSFR4Vk04azZCZDVUK09mNlhKMWx0bVRHOCtRRkIzQ2pI?=
 =?utf-8?B?UEoxR3JOT29RNUhrZHQzMmtKdTE4SWJyWGJNZXJxYWxyYTVDSlphUW93NUh1?=
 =?utf-8?B?NlR6KytNemZFUDFIUlNLckhuUStveEh5UUMwU0F6bHh4VWhVRzFqM3lhWEN5?=
 =?utf-8?B?c2hDWmJEd2M1LytuQUZQM1dRMlhxYUs4Y3VoWXhyMDFMMmRJS2xueTVCR3BS?=
 =?utf-8?B?STI3THdXdmxndkxhcFcwWitsRXd0UlhuMEJFSEdsSEd6U0lnYmdrVTJpcTJK?=
 =?utf-8?B?TlZpTDIrZ1VYQ3VzUUdONjFHTmRWV1F2TzB1azJrV2tuajNhS09KUjR1VVZr?=
 =?utf-8?Q?UCYtSJsxn80c5iVi5IXcAhI=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c76bf051-1cec-474f-4ae6-08dd8db8428f
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2025 22:41:08.8979 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Qf2O9oWfGmYQIWuH/jiFuvVH2sH2WKq6tSfvNhiQ9a0tutDu6Ygp+puqzNvmYyoHIyztuNzavpoTVVYL/LXQtKO1Pu1kVPFy6FMQ3vsruSM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6168
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

On Wed, May 07, 2025 at 04:03:26AM +0000, Patchwork wrote:
>   Patch Details
>
> Series:  Support active context utilization (rev3)
> URL:     [1]https://patchwork.freedesktop.org/series/148302/
> State:   failure
> Details: [2]https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148302v3/index.html
>
>CI Bug Log - changes from xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9_FULL
>                             -> xe-pw-148302v3_FULL
>
>Summary
>
>   FAILURE
>
>   Serious unknown changes coming with xe-pw-148302v3_FULL absolutely need to
>   be
>   verified manually.
>
>   If you think the reported changes have nothing to do with the changes
>   introduced in xe-pw-148302v3_FULL, please notify your bug team
>   (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in
>   CI.
>
>Participating hosts (4 -> 4)
>
>   No changes in participating hosts
>
>Possible new issues
>
>   Here are the unknown changes that may have been introduced in
>   xe-pw-148302v3_FULL:
>
>  IGT changes
>
>    Possible regressions
>
>     • igt@kms_hdr@static-toggle-dpms:
>
>          • shard-bmg: [3]PASS -> [4]SKIP
>     • igt@kms_vblank@query-forked:
>
>          • shard-bmg: [5]PASS -> [6]DMESG-FAIL
>     • igt@kms_vblank@query-forked@pipe-d-dp-2:
>
>          • shard-bmg: NOTRUN -> [7]FAIL +1 other test fail

The above failures are unrelated to this series.

Umesh
>
>New tests
>
>   New tests have been introduced between
>   xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9_FULL and
>   xe-pw-148302v3_FULL:
>
>  New IGT tests (1)
>
>     • igt@kms_dsc@dsc-with-output-formats:
>          • Statuses : 4 skip(s)
>          • Exec time: [0.0, 0.00] s
>
>Known issues
>
>   Here are the changes found in xe-pw-148302v3_FULL that come from known
>   issues:
>
