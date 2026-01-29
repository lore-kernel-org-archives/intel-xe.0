Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CC9FD73EA8
	for <intel-xe@archiver.kernel.org>; Thu, 29 Jan 2026 23:19:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 222EC10E19D;
	Thu, 29 Jan 2026 23:19:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KRlHWAxg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F67D10E19D
 for <intel-xe@lists.freedesktop.org>; Thu, 29 Jan 2026 23:19:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769728778; x=1801264778;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=CLh7EHT0+0N6SEuGy6kRAEGJ3PbIn6oBva4ODR3Jkl4=;
 b=KRlHWAxgWP/APdSE6lKMnhk4QYy8595QfcODSkrNIh3a0uvFAyxb37tI
 RrhNOw1RxpHVu/NUXkcCeR6mkaytAhmXs7+FFkDCr+VuJ2qLsE/9yUKPv
 e3HlHZt2tUNTAbTnZQhNcV5pgRCK3yXCVSTDjOISqjJlR0/vdQyDKOwxU
 7LUflp5M8iZKFMgdcVmGfBHhoumaJvPpEDPnOiC2Mm3/99hiICfK5Y/B4
 JAOWxf+bgAmkOE2pJkeNUeYknQvumhWQCaU5Rtu8oR1BdqyxHucWNC+P5
 /ggkoZ0P8gu4YgXMfMaxv7WVrythMsOFLkakjemJr5tFLjVUPiahgIk1E Q==;
X-CSE-ConnectionGUID: TW1gvbthQN2c4CtKIp0vrQ==
X-CSE-MsgGUID: 2prE1ejGRwWBIcvy53GY2Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11686"; a="88553522"
X-IronPort-AV: E=Sophos;i="6.21,261,1763452800"; d="scan'208";a="88553522"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2026 15:19:38 -0800
X-CSE-ConnectionGUID: 70ouK45gRTWoyeH5SmvFgQ==
X-CSE-MsgGUID: yTEDX/PiRb+a3cyLVSov7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,261,1763452800"; d="scan'208";a="208617657"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2026 15:19:37 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 29 Jan 2026 15:19:37 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Thu, 29 Jan 2026 15:19:37 -0800
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.24) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 29 Jan 2026 15:19:36 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NylqpG1q5UjlqZ8AY20rILrZ37Vwza5JJJtrrwdHc92fJsQhz8BPJD4oalM5wDNW3rWL+0ReTVFxX8H4fxgxLhDMCcXGOfcWSmRoVNhOSPfToWVOJbWtfBI19JPHnjfOIRdXW4vq4P7plOv+ce5pfDa3bNslkyYj7b54b7NzKo9/0hdzhHdy3YhMDFcefivnaZ80C4aLtd+3qjR9yeOY1IrrzD9bZJISQOckTIoOctKsOVOt5TZwKa1nbxkkPpIZOAfG//xaykSPiaDcvtBj999HjrNR/k3DeTZjPw3fpntGB7pCn6LafGgNYDjvjaATqyIKYtk+ItboFl7E4v7UOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CqaM2q+uYbE29LVJvCxKlhjRWW7oJOzL3SHsoAv3qtM=;
 b=BZODxdQ/+Y64fodEKQCqz+FjsfV77tF1iLxjJ+UjheWW3GbfNRWXMPqIgUSsmUKiXSf8t/a7vVmhRbEMN2OXxcHk2KEGwDrZFNQilpMaVSoWVxsyanZT/g3lOWGb4MInIXo8cmEJ1eOAnb7bwzqdTXoF5cxiK6d1nGTCjys4Pc1F5YOEKJ6f10j6I1wwnAbjh6ClpOZFvHhf7jbBdxICI3KoHOMvMZfYvxPv5SK7+3Tdig7l9AzcFnly3OzNzLmz1cUpaHTGov5/CuoM0CNBYKHfzF9GlEwPhoEQVS5diE8KbxC38XyX9+sBqeNsS6wOch0eAP/unSPWtR28LKVeIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by DM4PR11MB7326.namprd11.prod.outlook.com (2603:10b6:8:106::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.8; Thu, 29 Jan
 2026 23:19:29 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811%3]) with mapi id 15.20.9564.006; Thu, 29 Jan 2026
 23:19:29 +0000
Message-ID: <c8580774-10ac-4a29-ad43-9fb54f38c090@intel.com>
Date: Fri, 30 Jan 2026 00:19:24 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 6/6] drm/xe/sysctrl: Enable System Controller for Xe3p
To: "Anoop, Vijay" <anoop.c.vijay@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <umesh.nerlige.ramappa@intel.com>, <badal.nilawar@intel.com>,
 <rodrigo.vivi@intel.com>, <aravind.iddamsetty@intel.com>,
 <riana.tauro@intel.com>, <anshuman.gupta@intel.com>,
 <matthew.d.roper@intel.com>, <michael.j.ruhl@intel.com>,
 <paul.e.luse@intel.com>, <mohamed.mansoor.v@intel.com>, <kam.nasim@intel.com>
References: <20260129121044.3670780-8-anoop.c.vijay@intel.com>
 <20260129121044.3670780-14-anoop.c.vijay@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20260129121044.3670780-14-anoop.c.vijay@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1P191CA0011.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:800:1ba::19) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|DM4PR11MB7326:EE_
X-MS-Office365-Filtering-Correlation-Id: 17b61dcf-cd58-4cd9-8341-08de5f8cda20
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MHN1TzlzT04vUWtDUmtxdFJla2pYVGRSMUlEek15UWU2dytTVXBqVFhxQUQw?=
 =?utf-8?B?VDJsempvZ2tOUWsva2pJSkdGejk3NExGUWZTVDVkdEJlU1ZWT1pLa3lKV3lw?=
 =?utf-8?B?RUY0a0FjZmt6TWZ3eGZWdGdTMURkcVp6TTIvb1BhSWNmU0xzRFdaZm5FYkJU?=
 =?utf-8?B?SnZVZ3VnRTc0UlFRUEdRcWU1R0VtMWpkV25VTG9ZczRKQnlQNUlrUTNqQkxp?=
 =?utf-8?B?NDJaY3FZbHJwc3ZPT245ZXJsdEJ3a2pmYWQra2VNS0ZKYitoMGZOb2dBVWpk?=
 =?utf-8?B?a1FKT2hSbVVkV2VYaUdVZUFyVHlCZmNqdFRnWG5BMm40MUZYaGwrak1hTzVC?=
 =?utf-8?B?Z0JmUzhUTXgzc1BxR2RIeVMvc0pnUW5HVHkydkJrZFNsYTJTMXFHdG0rckxM?=
 =?utf-8?B?NVBQQ3lsdlhIazBzMFhmei9hRlJmejZQWWN5bGVlOTMzTnh1TVJWdERGYm5U?=
 =?utf-8?B?MnhaaWlobWdJeTJEdUFsM05UdnBpVXBRSzA1SjlZWjZKUmpnRkFSNGNSMlVx?=
 =?utf-8?B?NmVjS3g0WE8rUnpSZnZRNDlmWUZpN25YN082aEsrRXlZalZVR1gxNmVLdmZu?=
 =?utf-8?B?dlNPSmpSejh5TGJQdlQxY2NkMXlrR0ZxMWhCR3d2NUFyS2p3eEZmcGRreEFr?=
 =?utf-8?B?eW8wWDlJb0JnSTV1NVJIY0pwTERsS1Y5eW5rcWtXWDhvTnZPaFJwSUVWT3VR?=
 =?utf-8?B?Z0N5eWtSSWtpZmZQU3Nta0x4TktMRFRhSWtLQzVGQ0k1bDVuYzBaOXZJWURO?=
 =?utf-8?B?UHg2eGtGanp5dk10Ly9mQVNwT1VuUEthQWhtd3B6dzJaTlowUWJXa3lBZFIy?=
 =?utf-8?B?U3lPS0dpNXFJTEROVlR0R1Bicm00U0U1ZXVWdHozRXpxN1Nzc2tjREk4YkZU?=
 =?utf-8?B?ang3RTlqWVc5Y0lvdm1vdndoOC9uNndhRUxIMmNkVDhBaGVXV283Q1lDcDlR?=
 =?utf-8?B?cFBQUStOSXhhTGJWazZOTnRTMk5LWksyZEpXNmNic2hvdXRkNGdIWWExQ3Zz?=
 =?utf-8?B?amVIWFFEdC8rYXRacm5aajQ0bm8xNnJZQ21mekNYWGUwVzlheTNJRnVaeHl6?=
 =?utf-8?B?dWdUKzdGYVE2NkFaL040U1pmUVFNdkYwMHU2Zk9VYUgxQWlZZzYxclB4U3dt?=
 =?utf-8?B?ZXQzNmN3eWF0d2ZyMzZKSnRGbVYyME92NytrYUNzY0pOUW8vSyt1NWpMcUhj?=
 =?utf-8?B?a01wTG5pbkw0Y3dTUFIzOTQ0R2FOakt3NUtWZ0ppU1RLQTJ6bVVaRmhjZXFM?=
 =?utf-8?B?dlVxR085Wkh1S3B6T1BXSkp6alVwb3BXT0FMUVduOGJQNUExUFhNQ2NiZTFr?=
 =?utf-8?B?V2JIUHZOSFJuQ0tJVjZLNGZmWm9WQnRzR2pSZEVVcW9iUDVyMmlEcVhQazQv?=
 =?utf-8?B?MmtNbVJ5WXdRM2s5eG1DVThUM1E3MSt1cWRRQTlDamt6NlFLZ0FaL2dFbkw2?=
 =?utf-8?B?aWRxTGhLMXBhbS80UmhyYkl4QVY4bnFNamgwZWV4aER0aGZITVNkejFIajNo?=
 =?utf-8?B?cnBCam5RU3JMNXMvdUZraHBXRnJWSWg1MXlLSGo3OUJja0VYcjZRcWJqemxs?=
 =?utf-8?B?TTExZWVMb0VGUmJHaE42ZTVzamVXODhnN1BuK3dJdkVjVitkNks0a2ZhaE1H?=
 =?utf-8?B?UFFLZDRRQzhISk9ZcS9rKzVEQm50QUhMTXRqRnowYWpkNGZIU3JtMXQwYnNj?=
 =?utf-8?B?WkVhS055YUxzSVk2QUQrN0NmYTNucnhQbVpnVUlEby9TMkZkNUl0YzlqL0tW?=
 =?utf-8?B?NDdSMk5ObGpyN1VZaEhDTGc0MFpYSGxrc2Z4RTFyVnNCdW80RTA3VlNtcDU3?=
 =?utf-8?B?NmYwNExWMDA5ZTVMUlBUcEtTcWRPeFBUb1h4S1NTLzArQ01iR09xSXhBeHBG?=
 =?utf-8?B?dkwxUG9xbXA4M0NTV3VKVlN3d2ozVCtsYTZ1MkdnUzAyUkhjL1ZUb2o5WGN1?=
 =?utf-8?B?MEdHL1ZGRnNjTjFtVThQOFZxWVdjeXNQeEkvellpM2xacDVQM1oyZkdXODNr?=
 =?utf-8?B?bmRPMlptQUlvSGo1Q2lmRXFQUStKTXJVNDB1TXI5SjJXRWd5c3JsMnlCRTgr?=
 =?utf-8?B?UW9FLzcrN0tQcGdNRzNVYmhCNndPRldkU3NYSy9EMUNRUVE2NzJXdGtHYW1N?=
 =?utf-8?Q?kPeo=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Mjc3eUw5UlFTTmRIWE42SXR6eGhhazd6dkJXL2N1L3pRaUJnUnNWWGdZR3dK?=
 =?utf-8?B?VDhzdk96TmwzckYrY3ZRWWZteDFwbG43L0NmL014NW1acHF1a1ZScTJhT0wv?=
 =?utf-8?B?dFZiU3J3NWluYnJzMUZ5cmplazE1RzNaTnBqUjNORnQzZGRxVVdFYjVyVC9y?=
 =?utf-8?B?TTloRnd6eHNFRVgyQm5uckZCYWNMUnlKbWdKK2JEQTFNa1E2QXUwK1VLSzVL?=
 =?utf-8?B?allzTElocWpkNndFSnJJdDQ2TEZYdDhaSVZFY1lsWGRrWEY4NHlpanFQRFF2?=
 =?utf-8?B?RjlMZVoxQ0p0em1NRXJxMWwzYVBzdklEV1FIUTJ4dkR1cmdWSGVJV1JqTHR1?=
 =?utf-8?B?eHMrMGlvRHNacUhiK2ExblBFdGxydEdsRmRrWjgwSTl6NGg3NFkvSVdOblAz?=
 =?utf-8?B?a3ZVb2pKTXdOVGp0VG5HTnZGZjVxaW96dEhMZ1BzSU5OY01BNkovaityMEQy?=
 =?utf-8?B?c01PMGdqbnlRNjcvaVVVbjhrc0ZQdmtLNG5SaFlJWm9xSmppdnBpMGY0Mkli?=
 =?utf-8?B?Y0paYkZQUUxKTzlxYzZQNWJENGNrcXVnSDFMczdPUXh4NjBjZXRLNWZYdS9r?=
 =?utf-8?B?OElEYitHRENRbUlmaktwU1J5ZHV1MlIwelJFeWxtdjVWSFMxdEE2TE9vTHRX?=
 =?utf-8?B?WmU4RkNCd3k4RHk5SzRBOGkzS0p4YnRUNnZGT2dqUnVYS25XN1owQjI2VUcx?=
 =?utf-8?B?T3pKZkhKM3R2aGl0cmtKQTVGeGw1T00xOEl1VGJvbVdRNEUyZnQzaVpHSTY1?=
 =?utf-8?B?ay8zQ1BtNXcyTUxSdGMwRUJOWXlIM0taOEdFcm83dGNzODNJT3pmOWFYLzE3?=
 =?utf-8?B?MVpIZUJLaFl3NS9ZV2k5UnppWnQ1YmFoRnBNb1NldU85VHNFelVQd2YvMGJp?=
 =?utf-8?B?bWZySmNDcll0VHdXYnpRTFMwU2t1aUNZZ3JhYU1xVWNyK2JheVJNZW4zaWpC?=
 =?utf-8?B?T2RPWFJLbC8zVVovTHFFcERCOFhlMDhjZFZlVE1FS2RrcjNoVmRaY3oySm52?=
 =?utf-8?B?TU5FMHVyc0tzd0t2azVOcDBqMUc5SE5HWUZWUkZWNkhoOE1jcHdyK1dIeStW?=
 =?utf-8?B?YWlVZUdoZ0Y3azdmUTlFbkh5QU5QaURSbk5iek5MSWJiV1RBWHo2Y3U2YVFF?=
 =?utf-8?B?NktCcEp4SUxyaW5xL3N4cko1eGdLS1orS0ZwUjhzTitHbGtHN1pTdzliTmgy?=
 =?utf-8?B?bU1HZnFzU1RlLzNBL0FHM3hFVmEvRFJ1UTJ4ZXQ2OWxjbHZTeFh6clBPQ0hs?=
 =?utf-8?B?cTY2RktUb1R0N2xjdnRwZ3MwWkhYZDFnYzkxbnBDL2JqdHlqekNYc1VDR3VK?=
 =?utf-8?B?S2x5cGNWUDFYSkJPYzkrcTJ2QUlyOHFIenpTbWdwb294TW4ra1pBMGtDc2tl?=
 =?utf-8?B?NEduNGJkUjRlRGkvemJYaHliemtaRmM3UXhoTUd2Sm9nZ3BEck9jRmJlWVlM?=
 =?utf-8?B?MmVKQ0p0dFBYVTJsUlI1TWljc0lSaHNPY3hqSWJlKy9acjdwNC9wdHJxZmx4?=
 =?utf-8?B?Rnpqc25sVTRkc1RRbU1YZ1QvT0hYRGp5cjYrMHgxV2k3VktldHNWdDZncmVh?=
 =?utf-8?B?enBYTy9XYzJuM0tMS1VQZktGck56ZEh3UzF0bW9XWER4akJud1VCdW1jczJ3?=
 =?utf-8?B?VjhCbS8zRUtYTSt0OUxrYm5mR3VTbVA1NVJuOGtoSC91dTRLM1JXcisyNFZB?=
 =?utf-8?B?dkhvdWEvNzYvMk1veFpHNEkvN3Z0b0ZUakJXYVJKWXNvL2dYbHVONUprL2Vq?=
 =?utf-8?B?VDdtcWhTT0FvY0EvWG5GMGR1eTZjaDFRZm1VRlhZZW5CZEl1eElpV3NMMzhC?=
 =?utf-8?B?MzdWKzczZjA1MHdoaU5abVJIZUFValk1dEFoWkkzZTFRZ2pPeHBPU1RDU0Qy?=
 =?utf-8?B?SGJUeFd4Nkl6OXRFL1pyanlXYW1mMEEwb1E1UFNCRTUyd091NEppTkxoUkVw?=
 =?utf-8?B?SEVGcm9TRlFtR2ZuQlR5N3pHcThuR0VQdC80aWJ2TjRNalN4bXNaTkwzbGZw?=
 =?utf-8?B?OG5TSjR4eDMxWDBrd05pbjVEU2RNcU5sV21tM1ZoUVdGNWk4bS8zQ0dvdnFw?=
 =?utf-8?B?YTU2WWN1Vy9VQ29LckgvSjJvTmxvYTN6TXZPNGZOcGllNGN1bE1NRjJCdEhz?=
 =?utf-8?B?MTNCSlVIZlZHZVk1VDZGaTFLcktMdkZ0VnI5R1NVUVBIQVhzTmwvM0t5LzM1?=
 =?utf-8?B?Y2dJS0UrY1NXeTdhUUQyblhjNnA4VS9iVjZRTWR2WUt4aDF4c3FnWHVSR0c3?=
 =?utf-8?B?YitZVFByQzFmcmRuanhwamxJeGNUeHhMMzAxd0xZTDV1aG5zT1dKSFpFbUlO?=
 =?utf-8?B?NzNCWWtZRTJBS1NidU5YU0NGOUI3L1dmdnBodlhtMGNmNG1uTGRvbk1WaGtl?=
 =?utf-8?Q?vWHQUaHLYiJDDIWE=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 17b61dcf-cd58-4cd9-8341-08de5f8cda20
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2026 23:19:29.4276 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6zCZcyWLXmHjcphi269kSy+KEURReZAxYPhqPeLt1vGq9hzAwbHg4GRrMT40ZcexeCbK3OJ3ugPXctHY6xQILoj4l/FQv4AYdzdiUev2ZGo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7326
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



On 1/29/2026 1:10 PM, Anoop, Vijay wrote:
> From: Anoop Vijay <anoop.c.vijay@intel.com>
> 
> Add PCI device detection for System Controller capability
> and update build system to include System Controller
> components.
> 
> Signed-off-by: Anoop Vijay <anoop.c.vijay@intel.com>
> 

no spaces here

> Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
> Reviewed-by: Shuicheng Lin <shuicheng.lin@intel.com>
> ---
>  drivers/gpu/drm/xe/Makefile       | 2 ++
>  drivers/gpu/drm/xe/xe_pci.c       | 2 ++
>  drivers/gpu/drm/xe/xe_pci_types.h | 1 +
>  3 files changed, 5 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index 51a9a531fb7e..74c5e1683d70 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -121,6 +121,8 @@ xe-y += xe_bb.o \
>  	xe_step.o \
>  	xe_survivability_mode.o \
>  	xe_sync.o \
> +	xe_sysctrl.o \
> +	xe_sysctrl_mailbox.o \

hmm, it's quite unusual to add .c and update Makefile separately

>  	xe_tile.o \
>  	xe_tile_sysfs.o \
>  	xe_tlb_inval.o \
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index b5e8935fff1d..880367932e52 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -426,6 +426,7 @@ static const struct xe_device_desc cri_desc = {
>  	.has_soc_remapper_sysctrl = true,
>  	.has_soc_remapper_telem = true,
>  	.has_sriov = true,
> +	.has_sysctrl = true,

this change alone could be the last patch "drm/xe/cri: Enable System Controller for CRI"

>  	.max_gt_per_tile = 2,
>  	.require_force_probe = true,
>  	.va_bits = 57,
> @@ -702,6 +703,7 @@ static int xe_info_init_early(struct xe_device *xe,
>  	xe->info.has_soc_remapper_telem = desc->has_soc_remapper_telem;
>  	xe->info.has_sriov = xe_configfs_primary_gt_allowed(to_pci_dev(xe->drm.dev)) &&
>  		desc->has_sriov;
> +	xe->info.has_sysctrl = desc->has_sysctrl;
>  	xe->info.skip_guc_pc = desc->skip_guc_pc;
>  	xe->info.skip_mtcfg = desc->skip_mtcfg;
>  	xe->info.skip_pcode = desc->skip_pcode;
> diff --git a/drivers/gpu/drm/xe/xe_pci_types.h b/drivers/gpu/drm/xe/xe_pci_types.h
> index 8b2ff3f25607..170b428d199b 100644
> --- a/drivers/gpu/drm/xe/xe_pci_types.h
> +++ b/drivers/gpu/drm/xe/xe_pci_types.h
> @@ -56,6 +56,7 @@ struct xe_device_desc {
>  	u8 has_soc_remapper_sysctrl:1;
>  	u8 has_soc_remapper_telem:1;
>  	u8 has_sriov:1;
> +	u8 has_sysctrl:1;
>  	u8 needs_scratch:1;
>  	u8 skip_guc_pc:1;
>  	u8 skip_mtcfg:1;

and addition of the new flag in xe_device_descriptor and xe_device could be done together (like it was done in the past with other flags)

