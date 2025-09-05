Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B77E0CA0FED
	for <intel-xe@archiver.kernel.org>; Fri,  5 Sep 2025 07:07:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C50210EB29;
	Fri,  5 Sep 2025 07:07:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hr3lePui";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD26D10EB29
 for <intel-xe@lists.freedesktop.org>; Fri,  5 Sep 2025 07:07:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757056021; x=1788592021;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=2nvZma/Mv9TOvyhzz1tEh2lCDpmbO1nxnk6gZVGpboE=;
 b=hr3lePuiH1zr3fTwwUXBFW6WGtZ1YuzfpSYNY+NdL6BHJ7QuzQzX1TJ1
 S9HHogfjXUFxr8NM6MQL4TKoYm9IxTX7a/11TBs8rJ2yNBIqx/V01CwDd
 aS9ePP29e44oqk2OYdwoTjlZFZ5nrXJDyqoYMakJrDw+nxv5LEVxbbJmL
 CAg1RmV2oR8wUeCNUGKDhnSHLKbZ4qEkh+9YiaUfMRhOL85y0AWN2H9n3
 Hl97fImRrrORStizjSqX0U+rUDxT1+WCjLinqkJML8j/05aY/q/zih/ze
 w3hmfnNUBwUarHw/LuU2iGVu0ObwlrrcyQH8W2IR1fI2/0jegZxCjA5RA w==;
X-CSE-ConnectionGUID: r738LbRyTy6gJZ+RHl2ZAQ==
X-CSE-MsgGUID: ujiulZGeS1iFWbMWmXQl4g==
X-IronPort-AV: E=McAfee;i="6800,10657,11543"; a="58616605"
X-IronPort-AV: E=Sophos;i="6.18,240,1751266800"; d="scan'208";a="58616605"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2025 00:07:00 -0700
X-CSE-ConnectionGUID: UNcIIyIeStG7XyjdkM7RbA==
X-CSE-MsgGUID: Gt54tsMSRgafq/WaxIn0Lg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,240,1751266800"; d="scan'208";a="171669625"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2025 00:07:00 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 5 Sep 2025 00:06:54 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Fri, 5 Sep 2025 00:06:54 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (40.107.94.85) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 5 Sep 2025 00:06:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pBXhE8e9i982UYYZQBvb/X16y4Xgzo29zaI6xFZZdfhw+E2znBhAPbHDI4wEBeo7XkU6tL4qKH/S5IsEumrb/HsBXFo97+upeyFW1iVfxpzc7AUsNwC67fxegg39ytIkCXUo4FTUTqGrvkHFZjH2V9miOiK1rSGNpYckM36n6g9/F21e4Td5LabuKUdsblW57un73FfoUWbaDFYNxHF3JOIPxts0CNG4B85RYiWFJ7Z96B4YYrrM66YR2Xcm+TsYpFw0cDvnmjPIjQDKibfyNHzBmDLvvbFK8f7t/GJyf1tK+6ELM9fGzGF4wIrm7zGqf72KOMyKJNYuiqDqMjCAHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gAw3EHmzfcz9oOFPaQrpIgLalXnJleBhwB6MEVagjbQ=;
 b=oqLtjbMnkqqNHs908iJQwfIF/NCLAbXwIgndM/qLofeTRbZ/QcIIUZT+7bJm90ar5ib6i8OSTzETV5loPCk4QmhRPaOPeSpgNIjQAwvyKm9ErxUPfJC5lWh3i6btc6VvLSnlF/aKgWfNlR8Ai0KW/dFOM2dUdOl4lXH6yWrPX/DfWkuv+rL0XYJHrb73WvYEkobTzGc+1RqdxtO0phJ06UnnsoIXrBKF5rJdZZg9p7x9or5JHnSoaVSqHlSZmfFJD07AarvpOiJZcnxiTvf86Ou4pFSNBm6oeA5L4XfYR5S6/f81+HCo4nkCpXX/7zuTXb4CTTg/ujAObGvhGmpr3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8695.namprd11.prod.outlook.com (2603:10b6:408:211::15)
 by CH3PR11MB8701.namprd11.prod.outlook.com (2603:10b6:610:1c8::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.16; Fri, 5 Sep
 2025 07:06:00 +0000
Received: from LV3PR11MB8695.namprd11.prod.outlook.com
 ([fe80::4858:d790:3ac6:8541]) by LV3PR11MB8695.namprd11.prod.outlook.com
 ([fe80::4858:d790:3ac6:8541%2]) with mapi id 15.20.9094.017; Fri, 5 Sep 2025
 07:06:00 +0000
Message-ID: <e6e17151-dcea-42e8-a9ae-2f1fc67d5b53@intel.com>
Date: Fri, 5 Sep 2025 12:35:53 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] drm/xe/guc: Rename xe_guc_register_exec_queue
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Matthew Brost <matthew.brost@intel.com>
References: <20250904192918.7346-1-michal.wajdeczko@intel.com>
 <20250904192918.7346-2-michal.wajdeczko@intel.com>
Content-Language: en-US
From: "K V P, Satyanarayana" <satyanarayana.k.v.p@intel.com>
In-Reply-To: <20250904192918.7346-2-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0123.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:11d::6) To LV3PR11MB8695.namprd11.prod.outlook.com
 (2603:10b6:408:211::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8695:EE_|CH3PR11MB8701:EE_
X-MS-Office365-Filtering-Correlation-Id: cd04321f-4084-4d15-ab35-08ddec4aaaf5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cGxGL1pwb3Q2aWQ5Q3ltcDJBL1BZU3FBM1d3MkI3OHlIKzgrSzhheEUwNm1k?=
 =?utf-8?B?SjVWYi9iRkJacHBVYkZ3K0V6WERCcU9CenM0cVAxUEc4bGRNNUFHRkwzVkFQ?=
 =?utf-8?B?Um5YOXA5bk1JK3BNWFpKdWgvdXVGa2JQYnVDSkFRZW1vV1BUQk5UWTdIV2xK?=
 =?utf-8?B?WllFV1ZUeWs4UWFVL3kzNDNHUEhYZFJaQmpRVlFPWkl1RGR3a3lZV1BlaHJ0?=
 =?utf-8?B?OGptKzF2WXJPc0tIUFBGYmJTWmRLWnUrQm93aDgzSkZJMkVNSEdGLzNnNFFs?=
 =?utf-8?B?RlZUeGZtT2U5ZHlSU01qU1lKekVmNkxTNGVQeXgxS3hhS0duZ2xKNVVrNWtk?=
 =?utf-8?B?UXJiekErQkRiN2Q2bEFwellyeEt6MU5MZFFwcTUrbm0wMU9EMy9wN29sdnIr?=
 =?utf-8?B?a3Y1QjNxdXhhN0J1Y3pWZUFrbko4VHNyeUxKcHRFMXJqdTJ3OCtuazdEbmIw?=
 =?utf-8?B?elJJTXFHa1FSQzVjOUt2WUxKRC9TSzh6M20xc09rMVRjUnJoQ2YvM0xJVEJK?=
 =?utf-8?B?LzJJQWlDSDJiazg1NGdzbld6STI5aUNWTXpFbFRjQXdUSzhWNmFwNWx0aDVT?=
 =?utf-8?B?VVl4a053NS9FMHpsSmhRMXNvdDVMcXVjdzFHYWFlanQ5SGNtOVhMVUd4L3hH?=
 =?utf-8?B?MTNsRWdURnBpajdtbjcxNE55VE0yNXc5MnFkYnpIZ0p2aFJPTFlQV01YdUMv?=
 =?utf-8?B?Wmw4dmRueTJpR3ErWXRzREZiUHE5d2Qzb01FQlRCVm1nTWFRa2xRQ0pSbGFM?=
 =?utf-8?B?dzlBazhRK3pUY3BlUGZDWG02VTkvOFo2YzlZbHNGcmZFdytTWXNoWWx6RC85?=
 =?utf-8?B?RGUvcGpiQUgyTi9nUGlSTXdMUXJPNDFkU1RaV0d3T202NFVOZ0l3b280MDZ0?=
 =?utf-8?B?Z3JsY3RTZXlJd21ZQmZjOC9IcU9KbW4wdTFaTmNJOGNpY21iZElDRkFQanZ4?=
 =?utf-8?B?M3l6eFNsQVgvaVo2TXJXajFVelJNR3gzSFNyc3RmR21CRTJ0d0VVVTlrTlBp?=
 =?utf-8?B?RklEb2Q5c25oVE0zTVJEVjNMRHJsSU9mMm44NkxLYzJvajV3eEtjQlJpWlhq?=
 =?utf-8?B?QnJsVDd0QXMwZTFoMHNFUTF1NGFMc1djRnh4d3ZvTUhqUk43cUM4Tld4UElS?=
 =?utf-8?B?OXFWMDZzZWlPc1RaR1c0L1dKd1pFTXcweWdGT1d6SDJ4MnhrdGJNa0twajdq?=
 =?utf-8?B?MVJhV05iRnlCdGxsQUpwSGtOSkZBT05MU1pKZjFJZld4REoreUs4UnZoaXhu?=
 =?utf-8?B?L0V5WGVxNVVSZGpGZFIvRzUyenV3bmxXUjFCVktVNGNsNFljd3BXMUh6STY1?=
 =?utf-8?B?ZGpZQXhPQks2VkNnS2VVbmdVSzhBdTNNZU0wS3EwcmRNOWZxbjdVa2lFd3FS?=
 =?utf-8?B?eFFQd2VVNTUzQm9aOFNkWmEvMTU3SFhCSFQ3WXcvZlBhVzRsRGRzRy9rbC9y?=
 =?utf-8?B?ZTRVTGFTbnJBT0pua0trSzBRZFoxcmlqeWF2dzF6bW1ib2QyYVRlVnF6bXhX?=
 =?utf-8?B?QmhocCszWUlRU0JENzJDdzYvL2JWQVBoOThiWWpMR2VQL01NZm5KL2ZaOXkv?=
 =?utf-8?B?MjMyc3hEeitGekpGdy9tek9SYkFHcWtkSk83UGd6SVJYRitYOUVWV0VZRmRQ?=
 =?utf-8?B?blQva0hLT0tUWU11eGNvMUxuMU9zK2EySjJnbXRBeDlnL2J1bWc0RVVpbXU2?=
 =?utf-8?B?cUYvNEJXeWlMU3dDYVYwNUxTK25VdlBvNUJKVGMyQmxhWG5PTzJhRWpVYVJ0?=
 =?utf-8?B?N1RReGhQMzFaSXdhcktJTC9ONDRXQ2xrUHNlaGwyaDFRK2tiUTJiTmFGSnkz?=
 =?utf-8?B?NEJKREpjdmxpWDlHQnlDcG1lRUg3UEVOYU9OUFEyTnBBZG1JNEk3MTArVXZy?=
 =?utf-8?B?dkdJMmdkMUl0LzU1bFkyWDZ5SWhsZ0sxZkpzL1d2WlpZU2drZERZUHBtWWRH?=
 =?utf-8?Q?ryGwG5YuVXQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV3PR11MB8695.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bGVkWTA2UzFqZ0FDL1VvUXdQMGpFS2NnOHFnUmtSOHY4STFVTWtSSHFlYlZV?=
 =?utf-8?B?OVE1WmovYTlPelpOdUlOTzN5Y3JSUWxmcURKcGFZTmxUR0V2ZFpETnUwWWo3?=
 =?utf-8?B?SnBrKzZFYnpuNlR0MFJPamlrOUZkSFdCcHNWTW5kUjFkRTh2Tk5sdk5wVTZC?=
 =?utf-8?B?ZmFtL2lYSDU4TlAwSXRhR1IvOUtWK2pJUkxkclh0Uk1lWG1iUmhYM0ZSc2gw?=
 =?utf-8?B?Q0tITE5BaHFuc3d3aUlOMWlMdVFIRFpGSk9ucWpCMDYvT0tQK01MMzdZaG1B?=
 =?utf-8?B?aTNSWTI2V3ZVdVk0NWF0c20vZnZPNDkrblcwVkRtMHhYQi93MjgyMVN3a0RU?=
 =?utf-8?B?MnkwaE1nMXREbk4zSWJteU9KdHhYclZqUXlKb1VlQ2IzSUZldkpuQ1E3TWNt?=
 =?utf-8?B?WjdlT2I2dWszZEtVWFRHOHlnQ2JNbThvYkFJZmljT200QnpTK29GK3ZuQ1Z0?=
 =?utf-8?B?ZnpsRnJnVXhlTVFBSjQ1WWhIemNBRVRWTnplUjE5bmcxVHBwTlFhRWRoNkVN?=
 =?utf-8?B?dEVsRy9oK2pNbXVTNFRsaUpTUmUzQ05oS0o1NHdGNGRGeERBbzRFNDZUSXJG?=
 =?utf-8?B?SDFmSkdJdTR4aWpoUDlCYkJ6MjZyM1ZQNjE0SXlhdEpvdGYwODJ3TWt2QmVj?=
 =?utf-8?B?WlU3RnhhQWxQZU5nZjlRUU5DU0kvRU5GeE1wSmhqYlFyT1lPeFpPV2FiaHV2?=
 =?utf-8?B?YWlibDN5MW9NM3FpOE9YYnNrVVF4NkVtZTNtUDNsL25odWZGbWxFeWpvWitL?=
 =?utf-8?B?MG1zbHRMTHBNbkpLOFRlbEd1TDBHK29heU9rVzZaQkZNSVd4YlhqV2ZGS2Yx?=
 =?utf-8?B?MjJ0UjdlZE0rOHV0MnFJNUtVeXNRaythNHBXNVgwT0x6UjZ4MVZEWHR5T1dO?=
 =?utf-8?B?QTdqUTZ1ZVJ6Y1E5a0c3Q3ptRWU3UWpES3VWeG9wZHJDZkpzTmgvQUlvZ0ZH?=
 =?utf-8?B?QjhwdUd3alpRTTdJN0xRWlc1eWZHaXVvMlMxWDZiZ0ZwYk14YUQ0c0thekl0?=
 =?utf-8?B?YkZFVk9RakhOcEh0aFlRV0pnYUpoeUxYbVRWRGZWd2dVRkZmSk9lZUw4ODJF?=
 =?utf-8?B?ODFMV3RJdVNvZ0QxT1NwZzUvVWhBb1lTMkJpZkFTYWc2Q3M0U29KTC9reUtn?=
 =?utf-8?B?elNab2JnWG9pK2JDTjdZMGNhTGRlaVNQeXA3eEpzQ1BCSDdPbElQSGt4MHdW?=
 =?utf-8?B?VFoxVWp1TzlKRngzT2dpNFFCS2MxMDd6RzNVamR3bjdXalJ4YmtzbUVLK3VL?=
 =?utf-8?B?cVVOR2dGeGRSU3pNaUhVVVdjU20wbDNxNVB3QXdIcnNwMUNYSWdQdkg1UStJ?=
 =?utf-8?B?cWx6aGFpKy8wOGQwS2RUNHI5bkFXQ2JPU1o1eG1wQndtbHQ3cUZ0RVJaU1hS?=
 =?utf-8?B?UDRDR202NllraDF3ODlpMXFFMG1Cb1Z0ZDhFRWtFVExCSDQ5elBQSU8yclZ4?=
 =?utf-8?B?ZW1ZVFdSckRadUV0eWdBd2pXaThxQmJQR3pBZElrZUdLclJHOHJ6SFl0ZlNX?=
 =?utf-8?B?Vldva0JwWmlQVHJMdjlIenNiRG96enZJQ3BnMWVDTmVneW9ndlA0Z1RQT3ls?=
 =?utf-8?B?WnBpdHovNGZmRm9wYXVPZUl4VlF3dEhBb1hqcTArT0RzVFRlTWc5Wm5NWlp4?=
 =?utf-8?B?TnJvcWNUT1JMaGRpWHZ2dHJaZnhTMXgxR2krbHQxc0ExSkNoSkJaUUt3TExR?=
 =?utf-8?B?b00xbUJRWFljZVRyemhxQkppWEZFL0hUbjRiK0RkSlFEZVdwaHFIajhWZzRC?=
 =?utf-8?B?ajZNZkV5cUtocVN4eXlFVms2NHdsZnE2ZXMzOUF6aVBEajdMbk1SWUZoV0o0?=
 =?utf-8?B?bEVES0IvSEF3T1JuYkZKODhqMjZheEplQk02NUlmblprK1JnaHBOT01jZkpx?=
 =?utf-8?B?ZWpzaldxb0lheW9KemIrQ0VsSXFyTGlGTWN6YTV5VWxla296Q1ZOaGE4OUNC?=
 =?utf-8?B?V1BoSlhFRlN4SjlkOFdIUTd0eFhKRDY5Z0hGajVrZmNzMndMd0JYeTlRdjBJ?=
 =?utf-8?B?OHJXQTdTVkRVVnB6QnIrMXd3TTZPZWwxcksxUVp3RVB5emRpSnBuR1NDZ2dN?=
 =?utf-8?B?MkJnbjBsWStpa3M2VVpVenBtR0xhWGJoY2x0a0V1bU1zTGYxOHpIdmFuSTF5?=
 =?utf-8?B?WDZDNXREWXcvZDZpL0xTVXQ2UE05T2JST3EzSzc1b21UWDU0UXFTR2ZuejRi?=
 =?utf-8?B?MHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cd04321f-4084-4d15-ab35-08ddec4aaaf5
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8695.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2025 07:06:00.0836 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hRApUxhjU5nMhK1XI3pvdigYEOJ0S00vH3hI5g/eO351eYIKbioz/O+eUiN00Ky2ERz7bGOT1NMWzlYrejDGm75RwsovshD1WbubL0D+z4I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8701
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



On 05-09-2025 00:59, Michal Wajdeczko wrote:
> This function is dedicated for use by the VFs, we shouldn't use
> name that might suggests it's general purpose. While there, update
> asserts to better reflect intended usage.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_guc_submit.c   | 14 ++++++++------
>   drivers/gpu/drm/xe/xe_guc_submit.h   |  2 +-
>   drivers/gpu/drm/xe/xe_sriov_vf_ccs.c |  5 ++---
>   3 files changed, 11 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 1185b23b1384..f2920b047b2c 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -2528,7 +2528,7 @@ static void guc_exec_queue_print(struct xe_exec_queue *q, struct drm_printer *p)
>   }
>   
>   /**
> - * xe_guc_register_exec_queue - Register exec queue for a given context type.
> + * xe_guc_register_vf_exec_queue - Register exec queue for a given context type.
>    * @q: Execution queue
>    * @ctx_type: Type of the context
>    *
> @@ -2539,15 +2539,17 @@ static void guc_exec_queue_print(struct xe_exec_queue *q, struct drm_printer *p)
>    *
>    * Returns - None.
>    */
> -void xe_guc_register_exec_queue(struct xe_exec_queue *q, int ctx_type)
> +void xe_guc_register_vf_exec_queue(struct xe_exec_queue *q, int ctx_type)
>   {
>   	struct xe_guc *guc = exec_queue_to_guc(q);
>   	struct xe_device *xe = guc_to_xe(guc);
> +	struct xe_gt *gt = guc_to_gt(guc);
>   
> -	xe_assert(xe, IS_SRIOV_VF(xe));
> -	xe_assert(xe, !IS_DGFX(xe));
> -	xe_assert(xe, (ctx_type > GUC_CONTEXT_NORMAL &&
> -		       ctx_type < GUC_CONTEXT_COUNT));
> +	xe_gt_assert(gt, IS_SRIOV_VF(xe));
> +	xe_gt_assert(gt, !IS_DGFX(xe));
> +	xe_gt_assert(gt, ctx_type == GUC_CONTEXT_COMPRESSION_SAVE ||
> +		     ctx_type == GUC_CONTEXT_COMPRESSION_RESTORE);
> +	xe_gt_assert(gt, GUC_SUBMIT_VER(guc) >= MAKE_GUC_VER(1, 23, 0));
>   
>   	register_exec_queue(q, ctx_type);
>   	enable_scheduling(q);
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.h b/drivers/gpu/drm/xe/xe_guc_submit.h
> index 6b5df5d0956b..9e6f19b03e65 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.h
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.h
> @@ -46,7 +46,7 @@ xe_guc_exec_queue_snapshot_print(struct xe_guc_submit_exec_queue_snapshot *snaps
>   void
>   xe_guc_exec_queue_snapshot_free(struct xe_guc_submit_exec_queue_snapshot *snapshot);
>   void xe_guc_submit_print(struct xe_guc *guc, struct drm_printer *p);
> -void xe_guc_register_exec_queue(struct xe_exec_queue *q, int ctx_type);
> +void xe_guc_register_vf_exec_queue(struct xe_exec_queue *q, int ctx_type);
>   
>   int xe_guc_contexts_hwsp_rebase(struct xe_guc *guc, void *scratch);
>   
> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
> index 908590fa79d4..19786f64a7da 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
> +++ b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
> @@ -186,7 +186,6 @@ static void ccs_rw_update_ring(struct xe_tile_vf_ccs *ctx)
>   
>   static int register_save_restore_context(struct xe_tile_vf_ccs *ctx)
>   {
> -	int err = -EINVAL;
>   	int ctx_type;
>   
>   	switch (ctx->ctx_id) {
> @@ -197,10 +196,10 @@ static int register_save_restore_context(struct xe_tile_vf_ccs *ctx)
>   		ctx_type = GUC_CONTEXT_COMPRESSION_RESTORE;
>   		break;
>   	default:
> -		return err;
> +		return -EINVAL;
>   	}
>   
> -	xe_guc_register_exec_queue(ctx->mig_q, ctx_type);
> +	xe_guc_register_vf_exec_queue(ctx->mig_q, ctx_type);
>   	return 0;
>   }
>   
LGTM.
Reviewed-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
