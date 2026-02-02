Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA679E7314A
	for <intel-xe@archiver.kernel.org>; Mon,  2 Feb 2026 09:45:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6956610E3C9;
	Mon,  2 Feb 2026 09:45:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FhlaAEPr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31F6610E3C9
 for <intel-xe@lists.freedesktop.org>; Mon,  2 Feb 2026 09:45:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770025540; x=1801561540;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=YYa341OLOgrArLw42THPa2Su0y0xElf0QA3+rsVhyBA=;
 b=FhlaAEPrYg1yQ0mArcWzGlm7xgSCYcawcWA7chByG9DCCeveeIGDSA/B
 aGEGz9uZIaKzJ5jjN6CPvSw9QOTmFhBZO29wRAWgwviCbYGeEN+DI4uAC
 l9bnohKqPcZx2NHhnOHs906Cp3v0YEMmw+ecjLIm0dLDJyp1DhSKr9fND
 BC0N2AaY/TRMNX8O6ICTPIw8P6S3IQ+YLoWD5zM+A5EfMXParlAvk1n5I
 FJCYW0PyjNfx8gjLBPpZN707iPnW6GwbQD+8UeDLjj9SX99xvpCYUbjXl
 yXsVdEGEj1v2DtBmqrJJsKZ7as1Mm4pIzo27KNWZDmKjnpJUbOmU9wx4X A==;
X-CSE-ConnectionGUID: raHusyzmRjeKYFBI7oYqQA==
X-CSE-MsgGUID: iRwecV8BQsqpaBYsZ/rxoA==
X-IronPort-AV: E=McAfee;i="6800,10657,11689"; a="58760942"
X-IronPort-AV: E=Sophos;i="6.21,268,1763452800"; d="scan'208";a="58760942"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2026 01:45:40 -0800
X-CSE-ConnectionGUID: Zsd58EWwRr6G8uiA6Mrm4g==
X-CSE-MsgGUID: 1330YwcNQXCmqaDEo2YRwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,268,1763452800"; d="scan'208";a="240161613"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2026 01:45:39 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 2 Feb 2026 01:45:38 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Mon, 2 Feb 2026 01:45:38 -0800
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.38) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 2 Feb 2026 01:45:37 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QNFHmvRBy97P3XAVGwFABfd06TTQUVV1mbzHlhiaCSSkUDIYIhfbZzO+Lyz66ZsKgQ1kahYKCRZqEtiJTV3hMp3v8zYX81FdYIUhE0MsHrb3AkhhSJy+ontRKJ8KszgoHR7A0CIjuOKk5OVOxrMLAY1VsDchEWjodwNZb+SobdLy2PE/0zsOy69nqTYAKwO9FyuTavGJGJKmTPf6nQ6I28ad8SR1/T1rKG6MZQs6Yf5ohpXbHxy6FhJymUAnsAgRS+2tevRp2CS8QTwqx8Mfa71cEuiUQx09MB4j04FyLhfqyyOTkKVOXbd/1nh/EGJDuQSNPXFUwmsg31jXwOunwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iVdaVuug12hWfr1GvuzoiFSOWOi+puuPH/Iq1uasqq0=;
 b=FrzIUXNhtA9e+fouDziBD9ncV+sK1B/9fhh+QX/KclEYl9o+nFWqlKj8froONSMV5RLKk1vsYVTO/UuSLZzVs5Ov1uMaVDED/nTpXH634kO++tsEAO9pyjlvu/lDBoLDHxJTYdWUw21csBqclPq01RzVnIo1ZwoLIU0Xm5ZZoW3dtj9mfN+2Ao9sAdS6W46RY4uBqiYyrERnCe27u0jaSFOYAkxKYYuT3/kHLHunim4AEBfQd8qi37fW30bLBYxKGCB22zUP4dmDLDXIzYB5FCFGtXSGSQ810mY2P/Tw3HYGX8XLo2SgJJO5uWthQ0W4Rr03KweQEEXkQLIsP7qcmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 SA3PR11MB7628.namprd11.prod.outlook.com (2603:10b6:806:312::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Mon, 2 Feb
 2026 09:45:29 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca%3]) with mapi id 15.20.9564.016; Mon, 2 Feb 2026
 09:45:29 +0000
Message-ID: <21c6c544-8505-4d89-8d19-dd7b6dd988bc@intel.com>
Date: Mon, 2 Feb 2026 15:15:21 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/8] drm/xe/xe_pci_error: Implement PCI error recovery
 callbacks
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <rodrigo.vivi@intel.com>,
 <aravind.iddamsetty@linux.intel.com>, <badal.nilawar@intel.com>,
 <raag.jadav@intel.com>, <ravi.kishore.koppuravuri@intel.com>,
 <mallesh.koujalagi@intel.com>
References: <20260122100613.3631582-10-riana.tauro@intel.com>
 <20260122100613.3631582-12-riana.tauro@intel.com>
 <6e33c2a8-f50e-4c6f-a495-33447f89c29f@intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <6e33c2a8-f50e-4c6f-a495-33447f89c29f@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0115.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d0::15) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|SA3PR11MB7628:EE_
X-MS-Office365-Filtering-Correlation-Id: 16cd3e20-3824-4288-9ab8-08de623fcccb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UnRJT0krdFZKQ0J6aTdScUZYUFAyazNiVE4zOEppdjZpTEZTaGdpdGFpTE1V?=
 =?utf-8?B?UDFGYkJScTRvdlFjVmx0MzdwdXdOejZBdFM4c2YxM0ZVbHVjb0hjbEMxTnhl?=
 =?utf-8?B?eExhRkxPVmdtNUNsMlBQby9uSnZVdTlWRU5HMzl2aHE3SnExMzJwWVhDMmNJ?=
 =?utf-8?B?cy83eGVWVGtwaGR2amVDSlVOYjBzSEo5dG5JU1FramN0cE9JdW8rZWhIMDNz?=
 =?utf-8?B?Tjk0dmNpWHU3Z2N4akgxbVU5ckJMQTJhdXh2aG1iM3F3c0VVSWd6YlVZY3Zq?=
 =?utf-8?B?ZC9tRjNXemViOEM1S1pzbFFWTXZJUHJKRVJUUlZrYVArbHpaeUtyQmc5ZUZV?=
 =?utf-8?B?OWxUMmxyM0JOMnpMYkZUaGVEakF4TnN0cjM5Rm1DRGFBR0ZCZThMWkNaaU5m?=
 =?utf-8?B?SVg1RUw4NGY3bDdFVHZWVzdZQWZoMU1heWNGQkZsNzM2dVgxaEF2bEJOSjhY?=
 =?utf-8?B?RE43UGdqM000YnY4eEJPeU44Ykt1K3AxU0p6cjI5WW1GVkZxOGtLTnJ5eVZE?=
 =?utf-8?B?N0o4K1EzNmVRd250di95c2RUT0RFa3NPMzkvbkJDcXJndDB0SGJUVXJDUW8y?=
 =?utf-8?B?RXkzWk43eHUxU0tIaXZHeU1DeXJJN25jbDJvNkkwemllNE5tZ3RLZk9qTWdo?=
 =?utf-8?B?aEFGdmdtbkoyVHJTUldMdnZjZ0hJNDlnRUQ0aXgwZ2g0a2ozME12R2ZBSGpa?=
 =?utf-8?B?cUxTdFRRcEoreTN2ZCswM3VCczluNkNNTDBNNzRad3VVNk1vcC9PRHlhUWVt?=
 =?utf-8?B?ZHBOMXZmVmsrRktvWDI0cnZqcjI0aW8zb2dHSlNFdzUxZDZRSEkzc2hIYkRX?=
 =?utf-8?B?UThtaGtVU2dDakNkN3VYMWZXcXlBd0x1OTlYc2hic2M3U0MyMjZwR2VhNWtx?=
 =?utf-8?B?WGRQQkNPdVN3TmhOT0Z3VVNQZWhIZDl6UVhWVHYzNys0bmJkRDhoTWxEendp?=
 =?utf-8?B?WmI4V2hBOXBBZG9tVUp0UjRUMmVUQVF2REhZSGNDYXNMYmVvMnBVb2tPYURT?=
 =?utf-8?B?RmZBWmFibFhqcmw1YWlNMmpSbjQ1Rjk5RGIrdjNTelRRcDUvSzRIV05HSHU5?=
 =?utf-8?B?WlFZbnNPK2dCaGZZZ3BVNGh3RENWNENzYmkvNWdpcUVSdmxoNGxPYzIxbjFx?=
 =?utf-8?B?MGQ5d0Z2YXhhMGFSa1c4a1NVMURuaXNRaG1FM3J1dW45ZjV3QlhWNDhRd3Az?=
 =?utf-8?B?MDMzQTZQbW00M09BcWE1N3RvRjlsYkRpWmtNU0g2WFFJYzJzNm9lTWpNQmt4?=
 =?utf-8?B?MTBTekdMVEhmaUtkdlUxcURjWnpXU25QKzE2WDAyUlhiRElsR0ZDck16L0FC?=
 =?utf-8?B?c3ZTbGRzL3lNS2JEMHFmaEk0aE5mR2Y5Sy9xeUpTOU5iWUJBTWltL3VPYUJq?=
 =?utf-8?B?WWI5Tnhsc1plbk5xN1JKVk9iZWRyZkgzUEM0MnpaaktWZm5WREhtLytuZXh5?=
 =?utf-8?B?dzJzMmxDbDlGTzBZY1VIbDl0dmJmYjFYd1hVYWVvRWZuaGdIQmFIUzUwbzlq?=
 =?utf-8?B?U2t0bWtUYW9lYUVzd2VLOGd0cGo3WU9QL2VDbE94MjhRU082NEg5QlhtU2xt?=
 =?utf-8?B?OWQ3ZUp5SVBUUENqM0VMdHBUanM1cUl2SVlCVTFML1NGelJKVVB6c1piejlI?=
 =?utf-8?B?clh4UTAxcGkyQmZTTTE4bjdjcDJwQStIZmZ6WHNTTXJBQTAvZUc3d2xHU3VP?=
 =?utf-8?B?NmxYQ1dQWERTZkNoc0hKRGF2S3VndC9pYjNGNnBjaU9hSU9vWHd4dFdXSFhU?=
 =?utf-8?B?VXFVM0hocGIrcENDbE5ZZUQybjNSdFpRanNVOSt5b29TUW9MSis0RmxVNHhY?=
 =?utf-8?B?OVk5VkZVOXZmWUdZUkpDS0V3YWJXM0RqRmpBZXJ5NTZyL2VzU1A1SCtyeEgx?=
 =?utf-8?B?cjB1d0gvTHlmNllraEM4ZGVaTzFTM3dqYjdKaFdZOWc1bnJDREZZR2tPT3M2?=
 =?utf-8?B?eVplUWt4a0I5WGoxbU1HZm9NNjNtVVRmdmkzMFZqVFRJWUtsNEZodFpDd3RW?=
 =?utf-8?B?a2pmcXpYS3lRVy81Zk5wa251UzBNbFVXa2RmeDdwZzYwTXBmWjdMTlMyeXd2?=
 =?utf-8?B?bE80dy8vZUVZeHhCTEo1STB5U2g2TzY0VFFnTGd4aUE1TVJjUS9xQnM2aFdy?=
 =?utf-8?Q?VxKgBr9xuyk/p5Qv6+DJlUFnQ?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R1ZGS2hncXJCL1RkSDJhN1k4dmxpeWRzL2R5VGptbk9uSkI3R0ovYks4WkRr?=
 =?utf-8?B?Q0dDU29FMlZQc0duQjA2UnhOb09hUXRkK2pqZjZEa3dpSi9TRmZYMkFCV3JQ?=
 =?utf-8?B?WVRKaE5JODVUREUySGxzRXlIb1JYdkxrd0JvQXl5L0hBbjVPVUVPYkV6N3lW?=
 =?utf-8?B?UG1McG1zWFZyV0tkeFdUMmNFZ2tGbkhXZ3NRcGNWbEprSmJoRisrdEZGOUdR?=
 =?utf-8?B?OHNmWlVCSFkxNkJLNnpnRVZRNzBEREVvWDhGNlltRlNTRzNPeExtOHFEd3pq?=
 =?utf-8?B?ZFJ0UmUxRVRQckROenNJQzQzN3JNTzNyL1BwT2RvYVJkY1huQ0xZVnIyc3h2?=
 =?utf-8?B?cEJwcEFNZUIvOVFLRlc1Q1ZTMGhURWwyQUdRRER6Zk0vZG9ZREpScVB5SXY0?=
 =?utf-8?B?Z0JYWFZlZkFPTnZ0OUsyOFRLRktncTk0SnEvZGFSMDk4VHFxUit4SFZqT3Zv?=
 =?utf-8?B?eDlCOVFqcmxjUExRRlhFSW5VaGF4aFVSQWRpMktjSUxpcXRESVR3Q1pZWXkv?=
 =?utf-8?B?aHJvMkJDTGU1bFVBTEFkUFhEeEVvcStJUUtnZUQ0SFVJUmRXMlE0eFpsYmJj?=
 =?utf-8?B?Y3VNTzFTUHdaZEw0d0RQMUNmMG9oRWpXUzFLamJYemJvazZPV2xwbWFQMW9v?=
 =?utf-8?B?b0RDNEVVaGtCNXN3ZlY5ZW1HVTJRYjcvRS9QVloxNVVqL2pKSm9vU0xscmp6?=
 =?utf-8?B?eUM0WEhIaVZmalprTTNPbWlNeEN2UGJKNlF3dmc5UzE5M2RMS0o1cmpob21x?=
 =?utf-8?B?UEpqQ2NCcE9vZDZCMFZiOHhjdWFaVWhLUWl1U1BLbGNiZXdyT0ZYVUNqRWVt?=
 =?utf-8?B?b2pSTUEyWWsrR2tiUkFITnl4UjAyZXhBYWhpR0ViOG5kc0EvU0xESmNVa2l2?=
 =?utf-8?B?ank0OHc4ODFHYzNQQVZTYlZwa2NiRWt3YjNoVGZjTDJMNEo2aUVHYmloRzFE?=
 =?utf-8?B?UnQwMFZxSTZvV3VLR2t6cFNWamR1eElObUVFcFBwV1J5R3pCWnN4OGJOaFUz?=
 =?utf-8?B?eDcwSVBuWU1WdDQ4ZDJPSFg2MnhNV0V1aXJSUFZMa0RSZ0Fuc2lEMGo2cVNm?=
 =?utf-8?B?ZHdBWmZ5ZWw2WGhUREhKRTBMME45REJlQmM2OUdNblJzZEErUTVCc3EzSFBT?=
 =?utf-8?B?UTFOc0lCNE9GV0ljaTl5aEVtdEFUd1A5U0VVZG1CRm0xWFFCWWVFUkJsOWQ2?=
 =?utf-8?B?OXp4Y3ZtbW51dGNvdTJraVgwVHlqQUdzTmk4czcrQmowelQyVis0OWVhWjIy?=
 =?utf-8?B?bXZiQXZDTVBXV3FkVEFCdi9GM3BQcnN0YkNWUWlETi9wdHZwcFh5WVRzR1hn?=
 =?utf-8?B?OHBuVTViSjE3d2VPc2lrbHNNUTJMenkwTHpoVmIrdHYrdEkweHZ0Y2dQZHNG?=
 =?utf-8?B?R3o2NmZTb1ZEUVZDWmkrRDZhZndnTGpxd2NEU2NnTTNJUUxkYWxlSm1jL2JF?=
 =?utf-8?B?dkxFYituS3Z4cElWd2UwNngzdG5NQTZYMFBsa2FpbFlzblBVRU5QbFdXTDhk?=
 =?utf-8?B?SXJqRWgyUG53OUhPaDR0UzNpTWE5WVR3ZkQxWnVDbTAwRnY5TnRWSU9kZ2l3?=
 =?utf-8?B?M3VyNGFFdTZ4U0VLQWJKZlpDNVM3eG9SdThjT1IyYktNcG1VVWNDTitPYTBM?=
 =?utf-8?B?WmVFRGZ2cytrNGNxVUY3NUFaSkRzc2pDdHhLSjJzQTdZRHNZQXdsZ08zcXJH?=
 =?utf-8?B?QkZGdm1taXdqcnRNUGpIR3crVEJyV3lRWHZKUnJCZ1QybVJNeFZFVnRhTXND?=
 =?utf-8?B?UmxSdVFZdWV4OS8rc3R0SzdURmZwZWtKS3B6MUtydXR5Y3MwWW50TFVvd1dw?=
 =?utf-8?B?RWN4bHUvV0srQ2pmRXdnWmdXcWQ2OEdTTDI5NG9EQy9JQkgzTit6OHJMMWxY?=
 =?utf-8?B?bG9uV3M2QlM0M1NrOEZVczg5ZFhUSi92MXp5TVBQb1NjbDJSOHlQclQzdHZL?=
 =?utf-8?B?bDFEYWo0WHZsR2k0dWVwWXdGMC85THJJTFJNMFVnYTR2YXYyMGRyUnY5TlJo?=
 =?utf-8?B?V3ZpN1lOUmR1WVlHKzRNaTlsVllQd1hSczUxdm0xcWtUWlQrSlMrLzNzanpY?=
 =?utf-8?B?c3YvTW1mUTBwL1ROREdKcVBEa1Qzc2tJdnYwY254V1B0YjdKc01hcW5Odkpa?=
 =?utf-8?B?RTJ1QnA1WmJCTDdTSEwzN29DTG9iM0c4Z2Y5OU1qZ3ZWWW9vRTlQbWt2V0s5?=
 =?utf-8?B?WlpHdlZhS3o5WmRQOGtjcFZlRGZqUS8wbEdha3JUQzlvUFBheFk2bUNCbkNQ?=
 =?utf-8?B?a3hHKzVVblF0WkdvLzB4bzIybE9JaTcyZDZZZEptWWJrUFdqY2xkYmNjbjZO?=
 =?utf-8?B?S3duK1pZUkxBSVdiZ25RV2ZvdkNCbHlITTJyaVlGT2ptZE5sZFZwdz09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 16cd3e20-3824-4288-9ab8-08de623fcccb
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2026 09:45:29.5223 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3FjyjuAEJq4CjJF98Vcep2SvtzeTQrVdGKw0i14P6ncfQVvOMhJGsXojY/nE+liHV6whqF6Kh/PEXTWFdphtPw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7628
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



On 1/28/2026 4:19 AM, Michal Wajdeczko wrote:
> 
> 
> On 1/22/2026 11:06 AM, Riana Tauro wrote:
>> Add error_detected, mmio_enabled, slot_reset and resume
>> recovery callbacks to handle PCIe Advanced Error Reporting
>> (AER) errors.
>>
>> For fatal errors, the device is wedged and becomes
>> inaccessible. Return PCI_ERS_RESULT_SLOT_RESET from
>> error_detected to request a Secondary Bus Reset (SBR).
>>
>> For non-fatal errors, return PCI_ERS_RESULT_CAN_RECOVER from
>> error_detected to trigger the mmio_enabled callback. In this callback,
>> the device is queried to determine the error cause and attempt
>> recovery based on the error type.
>>
>> Once the secondary bus reset(SBR) is completed the slot_reset callback
>> cleanly removes and reprobe the device to restore functionality.
>>
>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>> ---
>>   drivers/gpu/drm/xe/Makefile          |  1 +
>>   drivers/gpu/drm/xe/xe_device.h       | 15 +++++
>>   drivers/gpu/drm/xe/xe_device_types.h |  3 +
>>   drivers/gpu/drm/xe/xe_pci.c          |  3 +
>>   drivers/gpu/drm/xe/xe_pci_error.c    | 85 ++++++++++++++++++++++++++++
>>   5 files changed, 107 insertions(+)
>>   create mode 100644 drivers/gpu/drm/xe/xe_pci_error.c
>>
>> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>> index f6650ec3ab42..5581f2180b5c 100644
>> --- a/drivers/gpu/drm/xe/Makefile
>> +++ b/drivers/gpu/drm/xe/Makefile
>> @@ -98,6 +98,7 @@ xe-y += xe_bb.o \
>>   	xe_page_reclaim.o \
>>   	xe_pat.o \
>>   	xe_pci.o \
>> +	xe_pci_error.o \
>>   	xe_pci_rebar.o \
>>   	xe_pcode.o \
>>   	xe_pm.o \
>> diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
>> index 58d7d8b2fea3..81480248eeff 100644
>> --- a/drivers/gpu/drm/xe/xe_device.h
>> +++ b/drivers/gpu/drm/xe/xe_device.h
>> @@ -43,6 +43,21 @@ static inline struct xe_device *ttm_to_xe_device(struct ttm_device *ttm)
>>   	return container_of(ttm, struct xe_device, ttm);
>>   }
>>   
>> +static inline bool xe_device_is_in_recovery(struct xe_device *xe)
>> +{
>> +	return atomic_read(&xe->in_recovery);
>> +}
>> +
>> +static inline void xe_device_set_in_recovery(struct xe_device *xe)
>> +{
>> +	atomic_set(&xe->in_recovery, 1);
>> +}
>> +
>> +static inline void xe_device_clear_in_recovery(struct xe_device *xe)
>> +{
>> +	 atomic_set(&xe->in_recovery, 0);
>> +}
>> +
>>   struct xe_device *xe_device_create(struct pci_dev *pdev,
>>   				   const struct pci_device_id *ent);
>>   int xe_device_probe_early(struct xe_device *xe);
>> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
>> index 944f909a86ad..2d140463dc5e 100644
>> --- a/drivers/gpu/drm/xe/xe_device_types.h
>> +++ b/drivers/gpu/drm/xe/xe_device_types.h
>> @@ -669,6 +669,9 @@ struct xe_device {
>>   		bool inconsistent_reset;
>>   	} wedged;
>>   
>> +	/** @in_recovery: Indicates if device is in recovery */
>> +	atomic_t in_recovery;
>> +
>>   	/** @bo_device: Struct to control async free of BOs */
>>   	struct xe_bo_dev {
>>   		/** @bo_device.async_free: Free worker */
>> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
>> index c92cc176f669..e1ee393b7461 100644
>> --- a/drivers/gpu/drm/xe/xe_pci.c
>> +++ b/drivers/gpu/drm/xe/xe_pci.c
>> @@ -1255,6 +1255,8 @@ static const struct dev_pm_ops xe_pm_ops = {
>>   };
>>   #endif
>>   
>> +extern const struct pci_error_handlers xe_pci_error_handlers;
>> +
>>   static struct pci_driver xe_pci_driver = {
>>   	.name = DRIVER_NAME,
>>   	.id_table = pciidlist,
>> @@ -1262,6 +1264,7 @@ static struct pci_driver xe_pci_driver = {
>>   	.remove = xe_pci_remove,
>>   	.shutdown = xe_pci_shutdown,
>>   	.sriov_configure = xe_pci_sriov_configure,
>> +	.err_handler = &xe_pci_error_handlers,
>>   #ifdef CONFIG_PM_SLEEP
>>   	.driver.pm = &xe_pm_ops,
>>   #endif
>> diff --git a/drivers/gpu/drm/xe/xe_pci_error.c b/drivers/gpu/drm/xe/xe_pci_error.c
>> new file mode 100644
>> index 000000000000..a3cc01afa179
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_pci_error.c
>> @@ -0,0 +1,85 @@
>> +// SPDX-License-Identifier: MIT
>> +/*
>> + * Copyright © 2026 Intel Corporation
>> + */
>> +#include <drm/drm_drv.h>
>> +#include <linux/pci.h>
> 
> nit: usually all linux includes go first

I thought this was alphabetical. will fix this in new rev.

> 
>> +
>> +#include "xe_device.h"
>> +#include "xe_gt.h"
>> +#include "xe_pci.h"
>> +#include "xe_uc.h"
>> +
>> +static void xe_pci_error_handling(struct pci_dev *pdev)
>> +{
>> +	struct xe_device *xe = pdev_to_xe_device(pdev);
>> +
>> +	xe_device_set_in_recovery(xe);
>> +	xe_device_declare_wedged(xe);
>> +
>> +	pci_disable_device(pdev);
>> +}
>> +
>> +static pci_ers_result_t xe_pci_error_detected(struct pci_dev *pdev, pci_channel_state_t state)
>> +{
>> +	dev_err(&pdev->dev, "PCI error detected, state %d\n", state);
> 
> nit: you can use pci_err()


This is not exactly pci_err. I will modify the error message to have
"Xe pci error handling" or something similar.

> 
>> +
>> +	switch (state) {
>> +	case pci_channel_io_normal:
>> +		return PCI_ERS_RESULT_CAN_RECOVER;
>> +	case pci_channel_io_frozen:
>> +		xe_pci_error_handling(pdev);
>> +		return PCI_ERS_RESULT_NEED_RESET;
>> +	case pci_channel_io_perm_failure:
>> +		return PCI_ERS_RESULT_DISCONNECT;
>> +	}
>> +
>> +	return PCI_ERS_RESULT_NEED_RESET;
>> +}
>> +
>> +static pci_ers_result_t xe_pci_error_mmio_enabled(struct pci_dev *pdev)
>> +{
>> +	dev_err(&pdev->dev, "PCI mmio enabled\n");
> 
> s/mmio/MMIO
> 
> but should this be still an err level?
> hmm, as we just report static result, maybe we can drop it?
> there will be already:

This would be at bridge level. For actual error scenarios, having a log
to verify if the callbacks are called would be useful

This is not always static. Xe error handling is added in subsequent patches.

> 
> 	pci_dbg(bridge, "broadcast mmio_enabled message\n");
> 
>> +
>> +	return PCI_ERS_RESULT_NEED_RESET;
>> +}
>> +
>> +static pci_ers_result_t xe_pci_error_slot_reset(struct pci_dev *pdev)
>> +{
>> +	const struct pci_device_id *ent = pci_match_id(pdev->driver->id_table, pdev);
>> +	struct xe_device *xe = pdev_to_xe_device(pdev);
>> +
>> +	dev_err(&pdev->dev, "PCI slot reset\n");
>> +
>> +	pci_restore_state(pdev);
>> +
>> +	if (pci_enable_device(pdev)) {
>> +		dev_err(&pdev->dev,
>> +			"Cannot re-enable PCI device after reset\n");
>> +		return PCI_ERS_RESULT_DISCONNECT;
>> +	}
>> +
>> +	/*
>> +	 * Secondary Bus Reset wipes out all device memory
>> +	 * requiring XE KMD to perform a device removal and reprobe.
>> +	 */
>> +	pdev->driver->remove(pdev);
> 
> what will happen to all devm/drmm resources that previous xe_pci_probe() has allocated?

We don't have a function exported that clears all dev resources so i 
added all devres in a  group in patch [1]. Any suggestions for this 
would be helpful

[1] 
https://lore.kernel.org/intel-xe/20260122100613.3631582-10-riana.tauro@intel.com/T/#mf4cfe9c4693defa9430c10a59b92800ba75b414e

> 
>> +	xe_device_clear_in_recovery(xe);
> 
> is it safe to access this xe after calling remove() ?

Will remove this

> 
>> +
>> +	if (!pdev->driver->probe(pdev, ent))
>> +		return PCI_ERS_RESULT_RECOVERED;
>> +
>> +	return PCI_ERS_RESULT_RECOVERED;
> 
> also recovered? maybe this should be PCI_ERS_RESULT_DISCONNECT

yeah this is a mistake. Thank you for catching this.
Should be disconnect.

Thanks
Riana

> 
>> +}
>> +
>> +static void xe_pci_error_resume(struct pci_dev *pdev)
>> +{
>> +	dev_info(&pdev->dev, "PCI error resume\n");
>> +}
>> +
>> +const struct pci_error_handlers xe_pci_error_handlers = {
>> +	.error_detected	= xe_pci_error_detected,
>> +	.mmio_enabled	= xe_pci_error_mmio_enabled,
>> +	.slot_reset	= xe_pci_error_slot_reset,
>> +	.resume		= xe_pci_error_resume,
>> +};
> 

