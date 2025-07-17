Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C36BC83F34
	for <intel-xe@archiver.kernel.org>; Thu, 17 Jul 2025 19:44:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 204D110E18F;
	Thu, 17 Jul 2025 19:44:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ffeYTQn/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33E3010E18F
 for <intel-xe@lists.freedesktop.org>; Thu, 17 Jul 2025 19:44:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752781479; x=1784317479;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=svk2et7OhixotaDcnMDPFKo/lVnQLZvhYnMOcxkrvWI=;
 b=ffeYTQn/27w5HtQ1IwJ1mPc32LDepphAsVJkJglC/2aeXfBCJe6Pc+Le
 ZtzSKQGwE2VnzYufNzgXvg5pHaJbRXVwRjbCA4GWj7EBuPiGayQhUoD7G
 R8K4W8ZmpbFiBkB+ucR3tZ82BiaTq7ykoBx9eVQfbyAhiTmTYLe4pSg7b
 OH7AW3Me+uUm2gS9rdpk85hMH7/Ase0OqS5EB/mn32SdJIZAj8BgtjzSm
 +C98fByvLLJZFZAN2IBlobEom01/lq8ZTofXXQpwdrwDKxOdzmbo6TRQV
 THe2Y6+5fyPmqyjXkrHHeBP8osslPBcIH/Vf3eEXOFGJqJ0Ch/3iedxRV Q==;
X-CSE-ConnectionGUID: 6BkkUxgQROW9dDxCkBGntw==
X-CSE-MsgGUID: ZGSpMdGSRVeLmF+OzdXswA==
X-IronPort-AV: E=McAfee;i="6800,10657,11495"; a="72641248"
X-IronPort-AV: E=Sophos;i="6.16,319,1744095600"; d="scan'208";a="72641248"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2025 12:44:39 -0700
X-CSE-ConnectionGUID: Asd4tt5UQz+EoafA9Z/CLg==
X-CSE-MsgGUID: wS0BpTEeS/qkvKRICkWejA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,319,1744095600"; d="scan'208";a="188864547"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2025 12:44:39 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Thu, 17 Jul 2025 12:44:38 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Thu, 17 Jul 2025 12:44:38 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.57) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Thu, 17 Jul 2025 12:44:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wz3YXv8WgRSaXiS9jfJHMLqHofYgme/TTVK+dwOTUJUrEqMy74JRKeRGd1bVyzbjOuuZBa5lDzrug24CTXeNosr8n1LFUPw/69ZUPHnaedSbYbUurRp9H6W2Ctap4gKDwm6aVK3xGzLwI7R6nqFtl0iKLHs+Fwu2NkY19vMTYvygEgl0vGxN/n3vswVwjgBmu3jSVPEi741+HSEOO9gkiGphF23q0nvK0nXvp0Ttmm4QuyvFFrOi59b/aYTFL6TMzrv5XeBGtiXxQ0HVFmKEOkGnJmRhbTFXK8hyY5WvAish6RaWps2pKVbHze2U8hqeSxm2CEd32B/ulWbBfn7s8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jvqtyCfK7wBfIl0+rYK7EAucwMWD2rDKKmGyfAhatKI=;
 b=TD67TctwtAYUGASvDtEu8C9EhVloKEpH1tIRybpLwJHN++fjfivpdss0Zeh/ktoZ3pFj+VTpBpOXs/7LWXRam+7FRj/NCsvsJExxK0mWIrFv26ukHxvBvOdj00ydvQ4SuehlUzLzl0jf3rL29OG+gAZkKRXMJhiOs4NmMNCk1Ru5ncnwMXl8qOEUKo+WMZ7l7EDyTHyEVvINDrmhCRuBLDkcXH716KfSNIrIVEzK2V2iKiXCIecJ6sqWQNN6S+fefyGRnaQNL6bQDIr5jbe/FFxeNMGEeCwClmP4rXoxRTUFQVRvRRtUmX0uAJ140CEmyDJEQ33j0Tkb8i9IeEaZ9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DM4PR11MB6094.namprd11.prod.outlook.com (2603:10b6:8:ab::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.27; Thu, 17 Jul
 2025 19:44:02 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%5]) with mapi id 15.20.8922.037; Thu, 17 Jul 2025
 19:44:02 +0000
Date: Thu, 17 Jul 2025 16:43:59 -0300
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 2/5] drm/xe/configfs: Enforce canonical device names
Message-ID: <duul5d3baqjos7uxl2nzvwo6q77bhvaiky5dlqa7febbzj4y7m@kh2mecfcifqi>
References: <20250717184825.851-1-michal.wajdeczko@intel.com>
 <20250717184825.851-3-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250717184825.851-3-michal.wajdeczko@intel.com>
X-ClientProxiedBy: SJ0PR03CA0247.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0::12) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DM4PR11MB6094:EE_
X-MS-Office365-Filtering-Correlation-Id: 1248828d-0514-4fa8-8f33-08ddc56a482a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UnZEUElzanBOQzFTUGNtWDRSUmI0TWFtR2s1Rk95c0J6WTlXeXloMlRka0ln?=
 =?utf-8?B?dzY5ck1rbFhUSURld3I0dWpVL3hKTXZwYjBuR1p6U2RTQXdvMUZnNUZWK05H?=
 =?utf-8?B?dGtLbk9Pblp5QWFBaXBEanBaT0xFQXBKdSsxSjZ3bVZsanMxdWdPOTA0ZG5t?=
 =?utf-8?B?WGd4Y1dvQWtWbG8xVVJIUTZRZi9mdUw3K3FWcHdKOEhmamhibWluVGo0Wkc5?=
 =?utf-8?B?WDJ1VmFibDVERCs0RGdNZHQvUzZDQ015RDVTV2t0dEtSeGtic1JzZUtodjhr?=
 =?utf-8?B?bFkrQmUwUDNuVHp6MUhRb01mRFNPVEFzWGxocVZSRkNVMEdtZkpMRHJLYzlT?=
 =?utf-8?B?ZUZJUElYYXQvQjMwd2Z4aG1JK3VrdEdkS1R3bUthQjF2dW9VbU5iODZZZ2pO?=
 =?utf-8?B?R2s3V1ozdEM3bDVxUHpIMmZwMWIrQTNTMmQxeW9MS3JIaTJrekdzMTlqZHJt?=
 =?utf-8?B?WG1KQW1KUkZNWjlwbzRjSHVucXFQM0lUMjNaZUl0WmJNSENQOUxOUTF2WGR5?=
 =?utf-8?B?Z0o1OFY1c0NDRld1Y2NzMzdtZXkzbS9RcTFiNXJRVXhvWGxoUXIwYWQ3bUpo?=
 =?utf-8?B?Q2ZDYi9ZNUQ3R0NDam8yckYxbnE3NnhkMkNaVjh0ejJYZFYrOTBTWFg4TVBJ?=
 =?utf-8?B?NjhwK21iMnV4OTBQLzVhb3FuQkVUUU9TMHdvd3Q2QURMOUxTWmdYWnJSSGkr?=
 =?utf-8?B?MEdkNjNpbmsyZmlENEM2VGVnL3ZFODNzbzdSVXNTaVJoMERaa2JYQmhDelJL?=
 =?utf-8?B?OHJwaHBjWWVHVjRQQUErV0o0a2tzaER1L3RyN3lRTGE2dGpuU25NVmhVc0pG?=
 =?utf-8?B?OStwWHp2Nm5ubG5KWFQ4SjBKR3pFcHBLYVBnRTFMM2c4OVFySk9iUk1uVHdl?=
 =?utf-8?B?b3YybTBXd0t3bW1qVHZtQUZnZzBkTUdUWXFTV1FpbEdMdURpQ0xGV0VUeGpD?=
 =?utf-8?B?Wm53dFBGNGlHMmhvV2xwbGNTeWhwRG5TTlBOY2JZNXlQUlhRMFMzSHlzWmJs?=
 =?utf-8?B?dE10dDNFbGJlcTdsZjllRlBIR3RkS3BRWWZ5aFpLRHlnZGZsTTcxT0JkOHMx?=
 =?utf-8?B?bHEwYnQ4R3Q5T25UVE1MNzFCQWF6a2RmYmhIRitqY2Y5dkV5UEc4WnNZRFNZ?=
 =?utf-8?B?Q0dYcVdUQ0xRVWVPL29abW5kZTFPWWFvaDdkd2NNMFpPQXdIOXVYL1Jkdk5Y?=
 =?utf-8?B?VWRkcjlvblA2dFRpMFZnWU9RMlkyQlNGTnhzK0J1eG12Y0haS2tkdkJ5UUtv?=
 =?utf-8?B?eUt6ampUdk5PUWdIYlhSb2pRUEhJeHkxa0dNaU5iNUZmSGRxY0xHTUw5N2xC?=
 =?utf-8?B?a01DbHV2NE82amNFUzg3SU9LY3NKamdvbnlMY3RSQUNoaTNOeXFwbGdOWVN2?=
 =?utf-8?B?Nkl2b2FzajVicnVVb1BLbXJuTUl3cndsUk9Bd0IvSnhHNTA5WGNGNzhyc2sv?=
 =?utf-8?B?K3JFc3BacW9oL0ZUTjdDQXB4R2lDcExPcHIzYXdERS9TbFo3NVhwOHZPMjZ2?=
 =?utf-8?B?L2gxRlFERTluODd0b2pWeFllTVFzK0tjYnMrN1JRZUpGV1ZPQjJ2clJadnpj?=
 =?utf-8?B?alIrUUhKRm5JNWlrSXlWeFh6aEQ2Q3BRdkE4ZWx3WWpqenpvc1NZY1kyVXRM?=
 =?utf-8?B?d2dHUE5jQW0xMUJEY2FEZU9uSHRGc1RtQ2xDTFlpTkttVkY2SmYwSXhxOXZ3?=
 =?utf-8?B?eW4rcFV0clJGWS93L01vb0tPRFNsMTFmRG9mVXNhdDVNWDhoU05Tb25lOFZK?=
 =?utf-8?B?TjNMMjFIU09TeVI2OU1TNnd0QnR0QzFKN2VMaldmRnNaamtpdEdZWmlaZjVO?=
 =?utf-8?B?NER4LzFWMHdtWFJFWVBNbW5Wb05JY3Y2T3p6bzI1dkxVRGlKSFgxTmdBV2Y2?=
 =?utf-8?B?S3FDMGRDYW45MHlpUnAwTEVlUDAzTFBmUnBnWDVCM0tSYmJLdzZ0c2x0cXBO?=
 =?utf-8?Q?piuVzJJ9F18=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aGhscThwZnhmUUNZNlE1b1FQZERyMFRtVjN1S0RWeUtnK3B0Mk5iQVYyVGNs?=
 =?utf-8?B?Wno0ZXAvS0ZmWGZPZTZ3Y3kyL2hpTCttdXFnY002N3RvVC9lTWp4MUdxaE55?=
 =?utf-8?B?ZmR3R29JV0RvR05zc0NGdGVuTUZPdWlzRHhzMzYvWFNybW9vbDY2bklpWDR3?=
 =?utf-8?B?S3B1eXhHY3VqZWxKU1gwM080bnAzWnVxcjE2UkhENHNvTjB0YVZOVmppTUpX?=
 =?utf-8?B?cGtoTVBtRGdRSzV5R2xOaERYcUFYL2FCeFA5T0Q3b0dYUUZrd1QrRmNyaVFB?=
 =?utf-8?B?U1RBTERvSzRuNHdPSFFWZGt2aWxoOVZWM21FNDF4TWE3MlN4NlJ1QVF3M1F6?=
 =?utf-8?B?OGF4TFdxTUtCUW1CU1A1cGtMaHZHUkUxWEgxUGxQY2tjblJUVkorYUhVTlRj?=
 =?utf-8?B?T1ZTa2VKUFlYYzJrVnY1eGRqbzFVMmtORzZNdTBXdjdVWUQ1QTFzQnE2T01y?=
 =?utf-8?B?K0tJcjRxVE15cG43ZUtGNnZuYWRobEFFOXNQZWJOT3Y5ZnVUWWZNRE9zODdR?=
 =?utf-8?B?MDNNaXRFWDkweWZ4U2dPZnE4VkE0QStpVnRUM05QcytBcjc1YmlEdDc4THI0?=
 =?utf-8?B?ekJta2tiZXFWbHBDelpCN2ZDbFRFdlhFT1JKVDhFNkRaeWZsdG81U0t2L1Ar?=
 =?utf-8?B?dTFmWnZYZnFZVll0cjgrbzZMZEFpZ0JnZGg3endEQnRpdVJKRzFsdXdYN1ZW?=
 =?utf-8?B?K1A1bFJtUXZTNjR3MWVZSWlBT1pBWnNaeFFsOVBDeDgxaU05NWk2YjZFd3hP?=
 =?utf-8?B?NnBhOGJuM3NINnFyd3JUWVl4ZFlQRzM5Q3lnK2pod29JVklDQ2FTb2N5cTNv?=
 =?utf-8?B?T3IxRVdIYVJyeE1OWElLeEJ0ZWVVdHRIZFQ1aU1aSlJNc3Q1RUszblJKTDl5?=
 =?utf-8?B?ajRLN0wwL29ldWs4TGNiSURxYTVGcVRvZUpBM01pRkFhRHdoYjFISWhQdW1W?=
 =?utf-8?B?Tm5La0RzQzkyOXczSngwRzZSbC9pUW5lcmFkSjkwN0JxTlBqa0gySUIyMXo5?=
 =?utf-8?B?MTJxM3h1cE1aYWdxYnQvTTFuRHZJc3JUeUVQZUFPTUN2WDlzZkZKaERmSERP?=
 =?utf-8?B?WkdWY3EzOW5tVWF5ekhQRUVQaFZSUWM1TGpqL016TlZ4RXZVMW0zK0dINHJp?=
 =?utf-8?B?UjhTNlEzcHAzQTJIcy8zWFhaQ0l3SGh0aTMzYkhRNW52TjhlTjFubWFjRnkx?=
 =?utf-8?B?UDdXREsxRWpEa00zVEVURkhObFI1eFg4NDF4bmE2cWZtbUNEYTRlQ291VGJR?=
 =?utf-8?B?U2RUUnMyUXF3Y0VtbGZzQ0lLTzU0cHZlVFl6QzRVbHBxNjdKUmF3Snc5bFJ2?=
 =?utf-8?B?enBOOFRBNHV2THRGSHgyMFZoYzhqS0NRbkNnRkJNMXo5Z0JZRjUyWWQyOEFU?=
 =?utf-8?B?U3pzZnR3MnlNSStDUWd0bkV2eFBubzJPK0NOU2RRYkFYMEJDemRuMURybWtT?=
 =?utf-8?B?RVgrN2IweWtqdEQ0NzRpeWpudUpobzljOERhWlVUVnlIT3hUU0ZUNFlQeVU2?=
 =?utf-8?B?eGd6UDVWaHNFb3FQenEwRThMZmM2QnNQUWkrR29WbDRTOHNyZlpjTHR1R1Qz?=
 =?utf-8?B?WU4rN1BPams4a1JxUG42dy9FMnI0bnM2TUJyNkt2Q01nc0g5UUR2N0N0SEor?=
 =?utf-8?B?di9ZWHNTVEdlSzBwUEhkbkl3cWlvOVpTMkhLelBjcHFqd1lBbXBERG4ySXRS?=
 =?utf-8?B?TS9tbzNUK1ZVaDlzWW5uTGV5U2RJbjRWQ1l1M1lFckxGY2pKVnZsQ2htSkh2?=
 =?utf-8?B?cHF5NHoxcTRHN3daUEFIRTN2QU9qV1V5UTZ0UlI2SWNIcXlqcnlRYlJER3N3?=
 =?utf-8?B?WW1ndW5oWVdHTUZQcXZjOFNqKytZbzdsQUM4aFpjT0pjT1E3UjRqWlE4ZmF0?=
 =?utf-8?B?WHZoVHRKS05JNVNHS0owaFV2U1JpUHRodVNTWHloeWhOWHF3Q1pxS0lQNVpV?=
 =?utf-8?B?OTFrYkxlcFR2eFpTVWM1NWhsVEJxV3EydEhOdlhGOEpYTWdZR3lJM2ZPQmZH?=
 =?utf-8?B?bkdGby9qV3hrZHNXeFpkTXJQRktvRGNBdXZaTDZEbDNVWXVNRDhXVU9mRW1O?=
 =?utf-8?B?cFRQOE00VmNEZXNGcjYzcXVMQ3U0S28zWjc5MTVwQm8yT2Z0UjZ1L2lyOXF2?=
 =?utf-8?B?dDZZSFptOUFlZU1QSzlZL3N2UW5lelUrT0JLWUtMSy90bWsvR3hZWGpuaWNy?=
 =?utf-8?B?b0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1248828d-0514-4fa8-8f33-08ddc56a482a
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2025 19:44:02.7294 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DEhJPJq6ZRQRDhvCq+GLc+wdax+AfsvKynPZ4cI3RpDcP7coY5Ft59RTt0PkNVJCpP3GAakturHG2/7JdmpBao2g9MKXBbJPtX0lOimhsCM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6094
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

On Thu, Jul 17, 2025 at 08:48:22PM +0200, Michal Wajdeczko wrote:
>While we expect config directory names to match PCI device name,
>currently we are only scanning provided names for domain, bus,
>device and function numbers, without checking their format.
>This would pass slightly broken entries like:
>
>  /sys/kernel/config/xe/
>  ├── 0000:00:02.0000000000000
>  │   └── ...
>  ├── 0000:00:02.0x
>  │   └── ...
>  ├──  0: 0: 2. 0
>  │   └── ...
>  └── 0:0:2.0
>      └── ...
>
>To avoid such mistakes, check if the name provided exactly matches
>the canonical PCI device address format, which we recreated from
>the parsed BDF data. Also simplify scanf format as it can't really
>catch all formatting errors.
>
>Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>---
> drivers/gpu/drm/xe/xe_configfs.c | 9 ++++++++-
> 1 file changed, 8 insertions(+), 1 deletion(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_configfs.c
>index e9b46a2d0019..90b4fe92a611 100644
>--- a/drivers/gpu/drm/xe/xe_configfs.c
>+++ b/drivers/gpu/drm/xe/xe_configfs.c
>@@ -259,12 +259,19 @@ static struct config_group *xe_config_make_device_group(struct config_group *gro
> 	unsigned int domain, bus, slot, function;
> 	struct xe_config_device *dev;
> 	struct pci_dev *pdev;
>+	char canonical[16];
> 	int ret;
>
>-	ret = sscanf(name, "%04x:%02x:%02x.%x", &domain, &bus, &slot, &function);
>+	ret = sscanf(name, "%x:%x:%x.%d", &domain, &bus, &slot, &function);

				     ^

This should still be hex. It may work "better" because we have up to 8
functions.

.9 and .a are equally bad, we don't need to fail one here and one below.

Also grepping around, it's always %x that is used. Exxample:

drivers/pci/pci.c:      ret = sscanf(wpath, "%x:%x:%x.%x%c", &seg, &bus, &slot,
drivers/pci/vgaarb.c:   n = sscanf(buf, "PCI:%x:%x:%x.%x", domain, bus, &slot, &func);


> 	if (ret != 4)
> 		return ERR_PTR(-EINVAL);
>
>+	ret = scnprintf(canonical, sizeof(canonical), "%04x:%02x:%02x.%d", domain, bus,
>+			PCI_SLOT(PCI_DEVFN(slot, function)),
>+			PCI_FUNC(PCI_DEVFN(slot, function)));
>+	if (ret != 12 || strcmp(name, canonical))
>+		return ERR_PTR(-EINVAL);

do we really need this? Wouldn't it be sufficient to just fail with
ENODEV in the line below?

Lucas De Marchi

>+
> 	pdev = pci_get_domain_bus_and_slot(domain, bus, PCI_DEVFN(slot, function));
> 	if (!pdev)
> 		return ERR_PTR(-ENODEV);
>-- 
>2.47.1
>
