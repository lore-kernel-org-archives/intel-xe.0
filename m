Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36323C2BD09
	for <intel-xe@archiver.kernel.org>; Fri, 28 Jun 2024 20:19:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3CD510ED40;
	Fri, 28 Jun 2024 20:19:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DmoqgXo9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 153E110ED47
 for <intel-xe@lists.freedesktop.org>; Fri, 28 Jun 2024 20:19:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719605960; x=1751141960;
 h=date:from:to:subject:message-id:references:in-reply-to:
 mime-version; bh=cgqrLpvKQSYV+qJiJe9nUR9k+lbwF4/GQ/tnumMJAdY=;
 b=DmoqgXo94vQdQBVgUgRiiPMEkzQHzXQLwPcW7zf4GEHD0AbshwnK+C1l
 nMWTdqe09Dp+dpPCi7bSI4TaN51hENRppPKcGC0AphUOnvXIFJU4shwTP
 YYN+RT0TSpMR0KZeciDAi2QC5J+ISp8i6DH8DmPZVREipdhMfaTlSGmWQ
 tuGmDvZiaUmif7PBX4KC/jiuVDnKcOl3kKmJud9eZLYFdj9VSB7O/9H+K
 5JckPD9Q9gm7fwzOGtbkRpj8j7dR9rQgtu67xUHMqjPFwGibLFe7k7ww6
 RiPnDOIpBJoo6bhIRa/sOlM8vQ0/z+Hxd6FMP1fygnoTo67W86vK69zz5 A==;
X-CSE-ConnectionGUID: PAc7j9CLSjmBiODfeKlAWA==
X-CSE-MsgGUID: 8/h6iCMESt+WY5gIpYZ8bQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11117"; a="42222417"
X-IronPort-AV: E=Sophos;i="6.09,170,1716274800"; d="scan'208";a="42222417"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jun 2024 13:19:20 -0700
X-CSE-ConnectionGUID: G1+7xUswTZmp2paCB++sHQ==
X-CSE-MsgGUID: f9VSgItJSzyUlkLKTBThnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,170,1716274800"; d="scan'208";a="75564365"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Jun 2024 13:19:19 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 28 Jun 2024 13:19:19 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 28 Jun 2024 13:19:18 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 28 Jun 2024 13:19:18 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 28 Jun 2024 13:19:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RrbE9L1sk0vjWP3wVPzpQA+0gKptB8N/tGTwUM2sImsHkJNE5ZhMc06V8x4DhAD3NCgdKtKuf8+ikFVZqOsCPEMKLKmd1L2TJCIxUVH+g/T1LK9E0Q1kETtYPnT5aVizAo8BjsSClAACvq3AZjxTko3gKvvFKVkp0qWrL5e9mbNYFWwnY4VZ02QEVFKeShC/hIAihJZWa63sIHpPY7l00jZ0nH0kkwDXBRXgw44elG2pW2LDMlzPt+sMY2xlw67cNkLzyFKCrA05nqP1gN9BzzwClaKekhE3vEzJAfmAZ8cJFkYbDKx27uLjCZe/24fvF7WqOeqUXSN3Be+y2bep1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cgqrLpvKQSYV+qJiJe9nUR9k+lbwF4/GQ/tnumMJAdY=;
 b=B6X1kx/LD4CsGz9aL4eMJMRJr9FI82+zwF61OBo0M43z3QqG3rDO6N8lH0TuyxSM3SKwwaIoM8viNcvwAnX815BGIAOsafru5x+2qpXshkqzdStDeH3LgubhODMNcyyqwWgFD4w9+P9Z33f+BwDZW5+HD3dM1a6/I3+c1VjVT4WzMDm3HQ8ZiZaH76UduFwd//JdFEVhvJ+1usq86cBH/dJk9O2aXQuJTjTTtrurQ+sU0ZYh5iPrfluyHgWHwqdUGod7o5gECEorlHAXTarM7dE3jTg0KrROJPaMyaAmgKmcnl07IiRjuL+d+WnvJ3c8dmigiqkuc2luvaqWUt0LfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by IA1PR11MB7388.namprd11.prod.outlook.com (2603:10b6:208:420::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.26; Fri, 28 Jun
 2024 20:19:12 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%5]) with mapi id 15.20.7698.033; Fri, 28 Jun 2024
 20:19:12 +0000
Date: Fri, 28 Jun 2024 13:19:09 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe: Get hwe domain specific FW to read RING_TIMESTAMP
Message-ID: <Zn8avZxVnWTAgFZE@orsosgc001>
References: <20240627235105.2631135-1-umesh.nerlige.ramappa@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240627235105.2631135-1-umesh.nerlige.ramappa@intel.com>
X-ClientProxiedBy: BYAPR08CA0058.namprd08.prod.outlook.com
 (2603:10b6:a03:117::35) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|IA1PR11MB7388:EE_
X-MS-Office365-Filtering-Correlation-Id: effe1abb-47a3-4bf2-9de6-08dc97af92e7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZlRCeFFXdEtNTVpBYWxUNzZBYjJTMUJUUXlYbCtyT2JmR3Z3WUNveW9WZlRQ?=
 =?utf-8?B?a3VzeDc1TU9mUm8yZTdSWXdML0dOeWtrL1d6SzFQMmFRRnA2YkZOOTg4b3lx?=
 =?utf-8?B?UVpEWi96MlRwK3IvYVRqeStYbjNJeWlSY1JuM2NJNzY1Sml4SStLOGhUeElL?=
 =?utf-8?B?VWMyWHp6Q2l1cjA4ak11azlKZ0lVYWtSWjl4WFE3Y2tHWHE0RXpxVy8wVkk0?=
 =?utf-8?B?K2F4YndHKzZmeG1QVzFBVmxCZWR0cE1QWlZyOE1Odk5Zc1VzVk5xeXBIdUxI?=
 =?utf-8?B?Y2VTQThaZmZUbFJnQy9CcHE3TkJZL2NNcHplb1Eyc0ROcG12d3laMW0wcWk1?=
 =?utf-8?B?ejd5TEhvWTNBNW9nN2J0cmxpNjVmTmM4MnhwRmlUNU50QWMxODJaTzExbGtM?=
 =?utf-8?B?OVRPdFhJRHY3d2tZRHFVQm91cU5pOVhGYUFjQnN2K0hFbE5QRERLU1BvRE9I?=
 =?utf-8?B?bzRkdlFOZEl4ZURGVFZuZU5RUEdjYjBQZ01Vb2J6eGJPTFlnWUFxc3oybk9V?=
 =?utf-8?B?b0hCS2VrOGxNY1VyYjl1SVJIZGhWaC9uVXJjcHdVakw0K1VubXNWb2RhRU1x?=
 =?utf-8?B?SWxIVWJTRmFVOVZvd0ludHF4c3c1UDRSMTl3NzhJVGRiRFZhb2xRT1NscjJ5?=
 =?utf-8?B?U0tncmZoQktRQkhWbFlVaDdLQTRWV1JyL1BSMUFCUUlvS09jc1hjYUFjVmM5?=
 =?utf-8?B?THAwRWpBLzdYVTM0MUkwNlVMSXRPdWRzZnhSa3V0OGxrZ2N6a0VFbzFHWXVu?=
 =?utf-8?B?Ymd3cVpJcllQUGg4Y3I5M2h1ei9Mb0N2WDFVRWNaR0tnY2NncmttYjFiTFJ4?=
 =?utf-8?B?RVZmZllJTU93aHRBdVVCcHZidVY4SGpXQ1VCM2V3MlpIMzZpS2t5Y1gzcnI2?=
 =?utf-8?B?VU5CUzQyTHM2ZlVFNG14bmhNVlUrK21IdDVrN2hsY3hJekV3RlRZYVJRSHd6?=
 =?utf-8?B?UStjblE0OW56blNrOWwvRkhXUTF2M282U0xsR01HMFVwajYxTjhCMUwwOHhj?=
 =?utf-8?B?dk0yZVBNbHhoNEV5NHcyNmpyWWlGSGtBQ1hWMnNwdWtoWVR3S29LSDVhSmlm?=
 =?utf-8?B?QjBrQmZkQ3pPUkFMVGxQY1JWSGRFdzBtSzBnbnJiZ3F1Wkg2STc2Zi84ZTdy?=
 =?utf-8?B?b2N3R2Z5dXlpbjI1aG1vV1VyUUZPMHBsRzk2RDRmS3o5blorK3ZXclhKL3A5?=
 =?utf-8?B?ajJnU3NDTkQyMU5BRi9FTlJLWlY3dU82NUdsaURqRUQ3TEp1TGZ4SkoxdmF2?=
 =?utf-8?B?SWFKTUljekpQRmpCSkJ2dHdIcVJEcDVnOUFaRndUOG9hclV0VHVXU2NCNmZa?=
 =?utf-8?B?ckptQXhUNGY1OHFpVUdnUVk3alhrZ3ZnUHJmQ0VWcys3RnZCQ2s4R2RtMlVP?=
 =?utf-8?B?Z2JYVEhtWlJVdTBBWGdBSnJISWxYVnlqQThpK0kvL1FIcGVvRm96RHduSzVy?=
 =?utf-8?B?NXI2M0dLSVNrbXdJMFNhcmk4YnpZTFpJQ1pTQWpaYU9hK1dXK1kyVFRNdEJi?=
 =?utf-8?B?RDZETDRlZEp2Z3NuUTFTMTQwcmJFRnpzVXYxcDJGaGdSTDQ3RkdNd052RzRw?=
 =?utf-8?B?bTVrSHZXMTVDcytSRnhtU0kzUFQ1dTVlN2VXdXRpRVRSTUVVRkMrZVp0T2Fw?=
 =?utf-8?B?Q0JmemJuYzJqbU0yRHpCNXA0RUR2T1JTMFBURnU4K3BQbFhFU29TT0NGdnFy?=
 =?utf-8?B?cHpPbENTZXFGOUorV2Y5YW8vVE1hZUw0MnNvcGI2aHZ1NS9tZWFBVTdmWGw5?=
 =?utf-8?B?L1R2MDJpbzNqbnJqV290RmtObG5YVkZOUVFLMUMvYU45a29NTGdmTG0wTDhx?=
 =?utf-8?B?Q0xBM1dTOTArTGE4V3B0Zz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T0ljTUVmVm1VQWVCeUZ0MTAxVHVLUDNybnc3OXZvalVaZVpIQ0VJWEQrSTFB?=
 =?utf-8?B?azNBQmY3Z2JrQklsNnZJZ0RBUjNlOWFFc0JWSGNld0h6MW80R0ZJaHNOUDcw?=
 =?utf-8?B?ZE5rSG5WdWJ6blZ2R2p3aUlUb3ZreWgwUnFHTytKL3dtS3RQM25uMnlqSDZw?=
 =?utf-8?B?MjdlVnlaSWYvZFBVeHVkNllSR1daMnBGQ3A4NkVvVGQ5ZkNFdnBMM2VFcjI3?=
 =?utf-8?B?a09xYTY5RkFib3FQT2Z1dzQyZVNuNktEQkJyVW8yd1ltS3dtNUxqSEladm14?=
 =?utf-8?B?aExiR1pZVFY0M29WUWFDTXRuOXZYaXc5N1lpRi9QZHFRTldEMWp6Y3RRRWpu?=
 =?utf-8?B?SnVMeFJqeTNDV3dPdTI1K1pCRnpiMUE2VGtKQ1JhSVlQRHZybnE2aDREeTE1?=
 =?utf-8?B?SkpvYUE1ZjBPQ2twaDZnOFlaSmQ4akk0M3FuY0dveGFHbEo4YVRvNitncVJN?=
 =?utf-8?B?S0dTaTNUanNvUWtWQ1FWS1ZPQU1INVZNWHpDamt2MEtia0xVRFFHczBCV1Mz?=
 =?utf-8?B?SGN2eDhzZm5VTjFrK1h6ckpOWHpNTVZpRGl1MS9ZZE5BRjIwUCsvNzZoVENQ?=
 =?utf-8?B?MElqaFpNaHBGS2RvQW1nK2dTMXBrNnpCSEJPaEFJZFNZRmtHR2lDQjUzVnJv?=
 =?utf-8?B?TnpHNGVpRnh1Q3lFU2pnTXRpbVlEbUI3a0Jhd1B5eTJpSERFOTB6WDRQa0Fh?=
 =?utf-8?B?dzVEMFlGV1ZqeVY3V1QyWDFzdkdCbDhrSFZYdFFMTEZTMm96MkQzQ2dDc3gr?=
 =?utf-8?B?VFY0TTc3N09ON0VhT1RhSU93L2tnOE9tUWtvaW5FeUZSOHorbUZrZXZVRVZs?=
 =?utf-8?B?Q25XeHVvU0hqNGxPOE4vTVdUU1lSQXZ3SE40dGk3QUVwUjduMVlpMFhLVG5C?=
 =?utf-8?B?SHRBUk0xUzBCTjYvVzVaV21Vd3NzMHZSMFB0K1lVNGkxaG42TmtZczBDWXNT?=
 =?utf-8?B?Sk51aU5mWGprdklJdC9mYjZ1Y1ErUWZyRm9YbUY4SWNjbGtLWDlWTlpSK0hz?=
 =?utf-8?B?L290bDYzR2hOWm5LOElHdnNWdFhRRzdwZ2lWZzJUTlNicTZTcVF3RFRRYlhz?=
 =?utf-8?B?QWlyWURWVW5FU2xGU0FNNFBraCs1UktwbzhXVUMrQWc1ZTg4UWZrYk8wWnM1?=
 =?utf-8?B?cHluMFNFV3o0eWhOZ0Q2YXN0VmdzZTNwWHBldXR5V1YzeERsSWZkY2kzQ3ZZ?=
 =?utf-8?B?OVVXWlMzQk4zdDRFd0lYZmU2T3pjUkdzc21RL0Q4aHErbEJrY3psUXhjcklU?=
 =?utf-8?B?YmZvVUNwN0Y1c3RrNkhOd3R6enBEWkxhZjkzVTMrWnhQU081U0t3WC9XQkYr?=
 =?utf-8?B?cEEzblZQcmNOUWlZU2VrYnNFdTcvNSs3b0EwZ2owemxQMVFrZ1NpYlBzM1ZZ?=
 =?utf-8?B?VXNzVzc2Q2p5RHhSUyt0VGZvQWxuVWNJc1BQc1ZBZ0Zhdi9OMHZmOTRVdGl6?=
 =?utf-8?B?cnFyNU4rT2lyOXE3eWhHekIzc2NIYmJtcXdBRTBIVWxSR04zNVRJM2RiYThZ?=
 =?utf-8?B?aGtUVlFjRHEzdzZnaVFNU2VzZHpETG4xdlpoc1M1Q0FucGVDRVpXMU5JbTJH?=
 =?utf-8?B?Z1UxNjhiaFZwSHBwTkNYVkd2T0RlaktUWmErYzJVRUoxSlE2TXNlZGhYYnp3?=
 =?utf-8?B?Z1daeWMxV2RhNlIxc1c2L1Q4TjYweEwvV3dpcXB2TXFVU0tWZmkvQXBaWlNO?=
 =?utf-8?B?alk2Z253K1BUREM5dnJTRE1DNDNkclo4eUNpc0ZOSVhKQnVYbE5vak8wcEpV?=
 =?utf-8?B?OWtNZGVWWFRkUUpiZlFuRjlTOWVzTzB4M1U5OWluMUpLVzZ6d2Q4aTNvcDVO?=
 =?utf-8?B?MmlkNmFCMjNsSmMzUHV2RExTaGhYQ3JZZVdnaE8rN1Mzc1N0Rk1aTFNBeFR0?=
 =?utf-8?B?TC9TYjhaU0Z3V1dSdHpjU2dqVml1TFRFSFBrYVRlbGhwTHZlbHlBa0pBTXhz?=
 =?utf-8?B?L3N2TXRBK01WVjdTa09NQlpwSDVRSFJMckwyWnRldUU2ai9DUFJSMThKOThv?=
 =?utf-8?B?ODhFMjNJanZ0UTFWTVRUTXhqWGxFMHc5cU56Ly9wemdmQ0htSEt4S240Y2Ju?=
 =?utf-8?B?eStKNTcwa21pWnBwQnNwa1lYZ25lTnZDVGQzQTlOOXBWaFFRYUhHMGNMc3FH?=
 =?utf-8?B?STVXV2Z0ZW9JSFZ0Y1pFTEg0SlRnZ1hVRk9XNk9iU0Q4SUJHVEE5dXJSeS8z?=
 =?utf-8?Q?fpmVw3s5Hzpm64tZzdnCv/A=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: effe1abb-47a3-4bf2-9de6-08dc97af92e7
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2024 20:19:12.0639 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3vqzd3sFJGG8J15qlJdb3MVMT4d2yU8JQadQlYOzPtYftjwstgc1HJ2wgwSj6hsEbSPTXka/ld41P8WhAhhsKseK6y/Fdegg8PZ0m+jGYsw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7388
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

On Thu, Jun 27, 2024 at 04:51:05PM -0700, Umesh Nerlige Ramappa wrote:
>Per client engine utilization uses RING_TIMESTAMP to return
>drm-total-cycles to the user. Current code uses XE_FW_GT to read this
>register on the first available engine in a GT. When testing on DG2, it
>is observed that this value is 0 when running test on some engines. To
>resolve that, get the hwe domain specific FW for reading the engine
>timestamp.
>
>v2:
>- update commit message
>- use domain specific FW (Matt)
>
>v3:
>- Drop check for hwe in the helper (Matt, Michal)
>
>v4:
>- checkpatch fixes
>
>v5: Rebase
>
>Fixes: 188ced1e0ff8 ("drm/xe/client: Print runtime to fdinfo")
>Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
>Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
>---

pushed,

thanks,
Umesh
