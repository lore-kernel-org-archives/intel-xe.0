Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9696E606A319
	for <intel-xe@archiver.kernel.org>; Tue, 20 Oct 2026 23:44:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=XTSgYn2p
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FA4E10F838;
	Tue, 20 Oct 2026 23:44:11 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A1DA10F838
 for <intel-xe@lists.freedesktop.org>; Tue, 20 Oct 2026 23:44:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792539845; x=1824075845;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=7gnL+UCoQU2xdXh0/DzzuXR/E4Z5twYHv+HmucRbrhU=;
 b=XTSgYn2pfbw8eOy8+bE6eYSVx+kT+dbiV/hAwHmNhag4HO1nvTqFquvM
 +HDf7EPkMv4xuGMg2Qf/q+FvVtVVMGtIhqjX1rc5SY5J6kXBpeq3EG5Jx
 rjlwZAjO2JJKldrVr9NwWeZ+V1cPbL0GNGu7pG/Ix8UqTKM9sV3WThgd2
 zFvKwCpxEox7aHID3QkDXt40lFrlrR2SdXHfV2l31pFtJRVjo5zlxfvgp
 AeISgKRn7NTsZigKNwnBEiEhDNhpYa8SVErmxPTlMIpkvCWxmgBs8cfqW
 HFC6EjgGcbAfezcqrAVoTlg0aLW1+dBNEd5EOTjtAbFJ+IQgsN06Alp0W Q==;
X-CSE-ConnectionGUID: o898QVomQDy1yFGqaQKWBA==
X-CSE-MsgGUID: lvZlgHZcSii5hcQV+N9YeA==
X-IronPort-AV: E=McAfee;i="6800,10657,11941"; a="1236939"
X-IronPort-AV: E=Sophos;i="6.27,169,1787036400"; 
   d="scan'208";a="1236939"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2026 16:44:04 -0700
X-CSE-ConnectionGUID: DrMT+NDsQzeZN/WdG0MUCw==
X-CSE-MsgGUID: MVZ240lAS3aoibymsMjg7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,169,1787036400"; 
   d="scan'208";a="2930834"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2026 16:44:03 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 20 Oct 2026 16:44:03 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Tue, 20 Oct 2026 16:44:03 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.24) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 20 Oct 2026 16:44:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZPSqMI4ZyKfM016bZe6xDK4MHUETDmUc6I/Vo1xbJq/dccTWCtHm8c3Bz0Y0L4GNh+LWPDiHokvoBww56k6kBZtvmHZe2Yk9qTBUxtLhH6gqdty/+KYxsk9e33OgRCjL+QbRErOaya2E/m3a732WKxIKpaF9ZLZOnh4uZnSMyZQqG5IofYdGEmkywa4mGaJcF8EKcinoyPoB7zOfXNrl1DB8w8FkUuqd6c0Ejg9cil0Kck7v/9gZexxnFp+CJa/i289KGZMqi85+f9e5zZblBHUPGV+0Xi69+CMgw7uAGSLz3GW2B/Aj6r9W7ysgwGsfEVxjMkBDLBHMNJCAVu0Wnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wHllxnSJ0Rxnt62MxVY68xJmyKv4kumOlUwEsJnLmwE=;
 b=M6pMfC57Osw6Tt9tdknNhf8Vwkh8J7j4FZ8Hb4pcbM92mWQAN+A4MQ0L9aB1vGQOHJEFEJfmcH582XnyKMM8CXx6OrdQY/udo2wR+22CSSLxksBHjjfxoBZbU63O1qKpbhb9nbBNp6I4DiO0srRGsswFtqJp2P7Hocf+5vr7Z7+Y9jW+7Sk14tGTYij8mbAJ5k3HElMt6kqyS+qqTGzRukheHOD16HoV/DxUc9xloxJLU8aqqlU0xZdQlLRGITyc1t2DHgxtSHtzrZpYsJmk4liczFtbM0rN2WqCPHuCMM10iEoB9/LKa4nSSAciIFrk8HyKpTpyIq/ykUElUr0o3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB4979.namprd11.prod.outlook.com (2603:10b6:303:99::16)
 by DS0PR11MB7829.namprd11.prod.outlook.com (2603:10b6:8:f1::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Tue, 20 Oct
 2026 23:43:56 +0000
Received: from CO1PR11MB4979.namprd11.prod.outlook.com
 ([fe80::ed0a:e4ab:fde6:edcc]) by CO1PR11MB4979.namprd11.prod.outlook.com
 ([fe80::ed0a:e4ab:fde6:edcc%7]) with mapi id 15.21.0522.017; Tue, 20 Oct 2026
 23:43:56 +0000
Message-ID: <34f5896a-0e9d-4eb8-893e-fca156dbc18d@intel.com>
Date: Tue, 20 Oct 2026 16:43:54 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/guc: Handle GuC semaphore instruction field check
 error
To: Jesus Narvaez <jesus.narvaez@intel.com>, <intel-xe@lists.freedesktop.org>
CC: Alan Previn <alan.previn.teres.alexis@intel.com>
References: <20261012192828.226700-2-jesus.narvaez@intel.com>
Content-Language: en-US
From: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>
In-Reply-To: <20261012192828.226700-2-jesus.narvaez@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ2PR07CA0012.namprd07.prod.outlook.com
 (2603:10b6:a03:505::13) To CO1PR11MB4979.namprd11.prod.outlook.com
 (2603:10b6:303:99::16)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4979:EE_|DS0PR11MB7829:EE_
X-MS-Office365-Filtering-Correlation-Id: 9f5d4b46-9965-44f5-78cf-08df2f04015f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|23010399003|56012099006|11063799006|261009221227099003|261009223027099003|10067099003|22082099003|18002099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info: M6zqoOgYbVgky23BurBffVEiK6k9jQAyer89lqQ6i79XTPBQOJMrwhLa3YYpBwYhArrbo1cRVBXrAGMCf+nCjE5rfp7dQeHtbfg0onRX4kWGSDZfBqN7FgIBOZYP2H5rm9Sn3trO6ckejnNZKt3/ViCUwHudvK86W/j8uTyCdvKCNNUL828FmNRhQyHSb8tG55tcqD1U65nQEXqvQ+SrSWy0UcC9w73pAPBTy7/goUoh5DD3IpAcXhRgepUcQjcnAmSsT3EAjiPYrGCsI816ZNqYg/LUno2fqMfYzPVzvGVc2zRcE90qmmv0MTUqgw4/o4169oCo/XotLB2AUSGoaptRDvxgqQ4PMeVUIRv6kuiuaPWJfvZuPOj/N1walAXH9H3fRuHAvvO5C6zd4G+yftXikoBXi4CukQ27tL8AuRZAZRBbkgglQjYEFIzvhDhUBLBBXcunK6yQ60B0GWvONTeCvC0RGKXzH/NfhNYPzX7n4ZLFBhG2BYEcbrNMqWECc/ypr8SYG95aL+65CE2sys38bMeXXgeFW/HS/rT8uKmp0c/gtZMAjXWPjLs0yR4OpeN9bVn6rz54u24fS7gLh2tTL4k9pBXhZofLym0N8VyOCHu5GK5tn/az1Lnucf/mha9SP3etbVCJacoDYl7CUcgIVPQ7Y0//fTxiXBHF6Ss=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB4979.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(56012099006)(11063799006)(261009221227099003)(261009223027099003)(10067099003)(22082099003)(18002099003)(6133799003)(3023799007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K3cvNis1Yk1QbTBSSE9sOXF3ZDdsdlFzRGJ4Q3pNVmpyRTZQYldWdjR1ZVJr?=
 =?utf-8?B?V3JOcmFDbUJlMnVuQ3NraGxkcWJnV0JaTytvT3pjbEJRckVvTVVCRkpCc041?=
 =?utf-8?B?UVM2MWZkMjVqdzB4bk5BR1pPWXF1VzhUa3oya3hPeVhTVm5HRTJTOU8xeWlk?=
 =?utf-8?B?dlBYT3ZZak1iWkt1cmd6QnhpWm9vUXluNEhrMEpuVmtMamVCaTlDZzBzT2tr?=
 =?utf-8?B?b0Y1eHdHZ0NNenAyRUREN1JQeWl0aHNVK2V5NkR2aENNNEk5M2x1dXZPVGFU?=
 =?utf-8?B?VUZXRkZVVE1Fc0p6bjd3bUo5VytWMW9zaVhrL1REMjN2QjZ1NDFKRGhKTGFR?=
 =?utf-8?B?dHc0ZFc5bk5FRWZmRFM2cG9tMEJFQVdGS3Zsc1VOMDBuaEVyKzErZFROU09I?=
 =?utf-8?B?NUZyblNxSlY4WlpwUTNFS3BBWTZMTkFsMzRHNExHM3ZFTW00SWpyOFh1dEZa?=
 =?utf-8?B?UXZsWDBwVFZPdmlaQ3dnMDg2OHplVng4eVpXR2dGQnh4amhVMFNPVis5Z3d2?=
 =?utf-8?B?dkxuU3J0Q2RJRHE5Lyt2aGMwdU0vSDFlY1lBYXJrTUROY1J5YTBZcWVGcG5Y?=
 =?utf-8?B?ZU1PTTJSTzR2WmR1Q2xOcGJuY3kyMG9KVGVNQXRZUUtadC82SnFTNUVIVlJP?=
 =?utf-8?B?S0pWVUQwbjJmTkM0Q3VoWUNNVzBCNmFGWlhXc2RYZFJHNUpYZC9qYlpYeEFO?=
 =?utf-8?B?Tk45Z0l3Q3V1Y0JnZVB5Rzd5NmVnOHNBQnJZUlZPZ3RNRlA0L2c3K2xqYUh6?=
 =?utf-8?B?RmR4YnVLVEgveXZNNm1sS1hGcDJIT2dBSHUwMUt0ZkpaWXp3UnhPNEQ1TVI4?=
 =?utf-8?B?MFpUQzdHOFk3cnJOUHhGN0QwNEU5UHFNZzhtN1VWczJFUzRoNWNOaWFFVjR3?=
 =?utf-8?B?S0pqNUhJVVJOalQ2a3Rzd2J6RDdrR3NXMmhoK0toSlhKRXB2bHdGYUZWMlZr?=
 =?utf-8?B?UjhtUXVkRWJidGFtZythc0dYL1hObWRWbGovVGppb2M4ZW42cWJFaFdKZXNq?=
 =?utf-8?B?TFhyQVJyNnZXbzZIZUR4SFZaY1hwSkNpaHgwSGc4eEkvYnBDRjlBQlN6MC9Z?=
 =?utf-8?B?eXE5MmhmTnV6dUs2L0YvQ1kxR3VXTFkvTmhJeGRzN05ydVRLWFV6N2VxK0Uy?=
 =?utf-8?B?QlplUm9kN2ZvYUVUR2dUWm5JTVhob1ZSdUpkUTJFNHdCVnNLWkJhaGFmbStw?=
 =?utf-8?B?K0haYkorUkphSDVrTEJ3ZjNncldyR0NXN0s4Qy9mTWFuWkVKaHZNVmRTMkxE?=
 =?utf-8?B?WnE2cGplL0pSS1NhcGhJWDJxZ2NmYWJkRDFINFRyQm1CdGdmSFVHOC9LV0d6?=
 =?utf-8?B?S08xTjBuaHlvYklYK0hIaTR5WlRpSEJJQ3dVcmVEWHlJeDJEY1hlQUpBZHdx?=
 =?utf-8?B?ZTJnRnovNWRpWjhCWDhNZU5pRDk1UGQzd1orY2hJRUJCdHJha05vQnBQN0Rq?=
 =?utf-8?B?eVJKdzNVUEY0UndJNlFNK0FSV0Y0cnN2a01mQWxsZnBRQUlHempnSERZcnFT?=
 =?utf-8?B?V0JHWTYwSVFpVzZ5SkRqb092RlJVZWMxODNOaXEwaHNaOGE5MVMxR3ZEaUpW?=
 =?utf-8?B?Q0tVUFJXRk1mZXdQVUNWdFUraDNEZU05R2NQMmZsanowaFVCOUoraVBhdEI5?=
 =?utf-8?B?UlNvRmxNcnhDNTZrbERnV1ZuVStrVnB3VElzVWdoSFk0Zm90Zm1YekNwVWZV?=
 =?utf-8?B?Q1VBM1h6ek5VNzVVOXBRYWxSY1cvNGc2WFIzU1dRS3crV2x0QUpLbE15Q0I3?=
 =?utf-8?B?N1RqaHMwRkFlN1dtaGVvS252TGNvZjAwcTN6Rm5Db1RUcUloZ3R4d05IbE45?=
 =?utf-8?B?a0h6ZDBEM21JU0I3R0FKN3ZXZ2J3c3dYdkREbmIyK1NYT0lqLzJQSkRpcmNN?=
 =?utf-8?B?bTlVKzRjT2pNdHhzek9YS0ViZ1pXVXlWaVEyTkh1V0N6ZEtINytqYXl3bU5s?=
 =?utf-8?B?ZDhaVjZtcVhDUUc0ZkhsQ2JiZFVQUlRId2NrbG5ZZWNwUThCYVk1Nzl0clhG?=
 =?utf-8?B?dnV0OVRKdFJVbnBiNGFCQkpmeTlBclVzcXJ6SURmZzVxem1uWHpvUE1wa1o0?=
 =?utf-8?B?blVpTk8zVldwRTBoU2pLN2ZYVVRQZE93cndEUGJ2NThoU3lJQzdyanVMR2lJ?=
 =?utf-8?B?bWtiSkJnSWRHR2t4N0kvcEJyQmRNZ3lHNzN4Z0ZpUGloYzRCUlFzcmlNTHlw?=
 =?utf-8?B?bzRsME8yTHpzTHNTU0hsWnIyNDVlUUhGZWlPOWI1Qm5FMnN4VHBOanhqTkdU?=
 =?utf-8?B?M1ZDTDEwUXJadmRZR2UzTE1kNzBzaStwdEgxdFIyNFJyUlN6U3VuK0NpNWtP?=
 =?utf-8?B?SDFjeG1PTjNjSjVYWXp6MUU3dlZFZ28rQXhQWFV0VGU5b1p4djNjb1d4M25S?=
 =?utf-8?Q?Rh1o7OK04N/nrSb4=3D?=
X-Exchange-RoutingPolicyChecked: KjIC1yEKDvcdS0oaGB/O3LY09iArDs2y9DUyivwSW8mfLSzrBtFR80jZ2hfriWY7/gQxOogH5kGHXTkPfNcC4CfjKt5VHhvrcdn9OArMhSSUDKhIT36EuDbEtFSrxyCfh6OJEFK840VvtmK7kn6hNTwLB6CwN/7HqcojzWsOovBqFciX6iikQONEpSnhSgpu+8f9JyMEZryciDBvJ3empvUqfmM481o+98h1tBHrpXnnxsQQcDTjJ8IHv23hb+w26S/q6rdwfmhC5MY/3ffHEPwrhY50CDkfyIPvGVHCoiwcCm6qC+Abx5eMr2688UpelXoMpVZlNfjOFzv7B9b5zw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f5d4b46-9965-44f5-78cf-08df2f04015f
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4979.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2026 23:43:56.0501 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IoWa/WDU4+bjwSEiwJ3twbZiFFTonZEacPpBMfT36Sc6t6wij8jYqlXPVYJfnPDLmuJgrDltPxZU1QFQWwVvbGqpRclOx70HxH8kH+4ko2Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7829
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-17.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On 10/12/2026 12:28 PM, Jesus Narvaez wrote:
> Starting on NVL-P and newer platforms which support 64 bit semaphores,
> opt in to enable GuC to check semaphore instruction fields when it
> receives them from HW.
>
> The GuC will send a G2H back if the check failed, so add a handler to
> deal with the context that has been marked as unrunnable.

This needs a bit more explanation on why we want the GuC to check this. 
The new commands have a field that is not used for HW execution and is 
instead passed directly to the CSB, which the GuC consumes. This check 
makes sure that no unsupported values are passed in this field, so that 
if we eventually start using those values (e.g. to send hints about the 
semaphore to the GuC) we don't risk a userspace regression due to the 
change in behavior.

>
> Signed-off-by: Jesus Narvaez <jesus.narvaez@intel.com>
> Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
> ---
>   drivers/gpu/drm/xe/abi/guc_actions_abi.h |  1 +
>   drivers/gpu/drm/xe/abi/guc_klvs_abi.h    |  9 +++++
>   drivers/gpu/drm/xe/xe_guc.c              | 10 +++++
>   drivers/gpu/drm/xe/xe_guc_ct.c           |  4 ++
>   drivers/gpu/drm/xe/xe_guc_submit.c       | 47 ++++++++++++++++++++++++
>   drivers/gpu/drm/xe/xe_guc_submit.h       |  2 +
>   drivers/gpu/drm/xe/xe_trace.h            |  5 +++
>   7 files changed, 78 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/abi/guc_actions_abi.h b/drivers/gpu/drm/xe/abi/guc_actions_abi.h
> index f5c9b37038d4..520b771906cd 100644
> --- a/drivers/gpu/drm/xe/abi/guc_actions_abi.h
> +++ b/drivers/gpu/drm/xe/abi/guc_actions_abi.h
> @@ -143,6 +143,7 @@ enum xe_guc_action {
>   	XE_GUC_ACTION_MULTI_QUEUE_CONTEXT_CGP_SYNC = 0x4603,
>   	XE_GUC_ACTION_NOTIFY_MULTI_QUEUE_CONTEXT_CGP_SYNC_DONE = 0x4604,
>   	XE_GUC_ACTION_NOTIFY_MULTI_QUEUE_CGP_CONTEXT_ERROR = 0x4605,
> +	XE_GUC_ACTION_NOTIFY_CONTEXT_INVALID_SEMAPHORE_INSTRUCTION_FIELD = 0x460B,
>   	XE_GUC_ACTION_CLIENT_SOFT_RESET = 0x5507,
>   	XE_GUC_ACTION_SET_ENG_UTIL_BUFF = 0x550A,
>   	XE_GUC_ACTION_SET_DEVICE_ENGINE_ACTIVITY_BUFFER = 0x550C,
> diff --git a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
> index 4bcdc1a96785..c63387ebc173 100644
> --- a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
> +++ b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
> @@ -169,6 +169,12 @@ enum  {
>    *      This flag will enable notification from GuC to KMD via G2H message
>    *      GUC_ACTION_GUC2HOST_NOTIFY_UNCORRECTABLE_LOCAL_ERROR upon receiving the
>    *      same interrupt from the CS.
> + *
> + * _`GUC_KLV_OPT_IN_FEATURE_SEMAPHORE_INSTRUCTION_FIELDS_CHECK` : 0x400A
> + *      This flag will enable the GuC to check the semaphore instruction fields
> + *      when GuC receives them from HW. If the check fails the GuC removes the
> + *      context, marks it as not runnable and notifies the driver via G2H
> + *      message GUC_ACTION_GUC2HOST_CONTEXT_INVALID_SEMAPHORE_INSTRUCTION_FIELD.

nit: "instruction fields" feels like the GuC is validating the whole 
instruction instead of a single field that is copied in the CSB

>    */
>   
>   #define GUC_KLV_OPT_IN_FEATURE_EXT_CAT_ERR_TYPE_KEY 0x4001
> @@ -180,6 +186,9 @@ enum  {
>   #define GUC_KLV_OPT_IN_FEATURE_UNCORRECTABLE_LOCAL_ERROR_NOTIFICATION_KEY 0x4004
>   #define GUC_KLV_OPT_IN_FEATURE_UNCORRECTABLE_LOCAL_ERROR_NOTIFICATION_LEN 0u
>   
> +#define GUC_KLV_OPT_IN_FEATURE_SEMAPHORE_INSTRUCTION_FIELDS_CHECK_KEY 0x400A
> +#define GUC_KLV_OPT_IN_FEATURE_SEMAPHORE_INSTRUCTION_FIELDS_CHECK_LEN 0u
> +
>   /**
>    * DOC: GuC Scheduling Policies KLVs
>    *
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index 3ab4cb9e4964..a0c693a1e74f 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -663,6 +663,16 @@ int xe_guc_opt_in_features_enable(struct xe_guc *guc)
>   	if (supports_dynamic_ics(guc))
>   		klvs[count++] = PREP_GUC_KLV_TAG(OPT_IN_FEATURE_DYNAMIC_INHIBIT_CONTEXT_SWITCH);
>   
> +	/*
> +	 * 64 bit semaphore instruction fields check support was added in GuC
> +	 * v70.64.0, which maps to compatibility version v1.33.0.
> +	 * Support starts with platforms that have 64 bit semaphores, which
> +	 * is NVL-P and newer.
> +	 */
> +	if ((GUC_SUBMIT_VER(guc) >= MAKE_GUC_VER(1, 33, 0)) &&
> +	    xe->info.platform >= XE_NOVALAKE_P)

If we have other uses for this check, maybe it's worth adding a 
"has_64b_semaphore_support" in the platform definition structs? not a 
blocker.

> +		klvs[count++] = PREP_GUC_KLV_TAG(OPT_IN_FEATURE_SEMAPHORE_INSTRUCTION_FIELDS_CHECK);
> +
>   	if (count) {
>   		xe_assert(xe, count <= OPT_IN_MAX_DWORDS);
>   
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> index da5ce97484b8..cdd7285465b1 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> @@ -1802,6 +1802,10 @@ static int process_g2h_msg(struct xe_guc_ct *ct, u32 *msg, u32 len)
>   		ret = xe_guc_exec_queue_cgp_context_error_handler(guc, payload,
>   								  adj_len);
>   		break;
> +	case XE_GUC_ACTION_NOTIFY_CONTEXT_INVALID_SEMAPHORE_INSTRUCTION_FIELD:
> +		ret = xe_guc_context_invalid_semaphore_instruction_field_handler(guc, payload,
> +										 adj_len);
> +		break;
>   	default:
>   		xe_gt_err(gt, "unexpected G2H action 0x%04x\n", action);
>   	}
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 7ce73489c35f..35965667c198 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -3708,6 +3708,53 @@ int xe_guc_exec_queue_cgp_sync_done_handler(struct xe_guc *guc, u32 *msg, u32 le
>   	return 0;
>   }
>   
> +/**
> + * xe_guc_context_invalid_semaphore_instruction_field_handler - Invalid semaphore field handler
> + * @guc: guc
> + * @msg: message indicating which context failed the field check
> + * @len: length of message
> + *
> + * The GuC has detected an unsupported SW Token Info value in a 64 bit semaphore
> + * instruction and has already removed the offending context and marked it as
> + * not runnable, so trigger reset-cleanup on the queue to match the state GuC
> + * already applied.
> + *
> + * Return: 0 on success, -EPROTO for malformed messages.
> + */
> +int xe_guc_context_invalid_semaphore_instruction_field_handler(struct xe_guc *guc,
> +							       u32 *msg, u32 len)
> +{
> +	struct xe_gt *gt = guc_to_gt(guc);
> +	struct xe_exec_queue *q;
> +	u32 guc_id, type;
> +	u64 lrc_address, token, data;
> +
> +	if (unlikely(len != 8))

The GuC specs list the payload for this G2H as being 6 DWs long, but the 
GuC code is indeed writing 8; probably just a spec bug, but we should 
wait for them to confirm before merging.

> +		return -EPROTO;
> +
> +	guc_id = msg[0];
> +
> +	lrc_address = (u64)msg[2] << 32 | msg[1];
> +	token       = (u64)msg[4] << 32 | msg[3];
> +	type        = msg[5];
> +	data        = (u64)msg[7] << 32 | msg[6];
> +
> +	q = g2h_exec_queue_lookup(guc, guc_id);
> +	if (unlikely(!q))
> +		return -EPROTO;
> +
> +	xe_gt_info(gt,
> +		   "GuC: invalid semaphore instruction field! guc_id=%d, type=%u lrca=0x%llx, token=0x%llx, data=0x%llx",
> +		   guc_id, type, lrc_address, token, data);

We don't need/want to print the LRCA.

Daniele

> +
> +	trace_xe_guc_invalid_semaphore_instruction_field(q);
> +
> +	/* Treat the same as engine reset */
> +	xe_guc_exec_queue_reset_trigger_cleanup(q);
> +
> +	return 0;
> +}
> +
>   static void
>   guc_exec_queue_wq_snapshot_capture(struct xe_exec_queue *q,
>   				   struct xe_guc_submit_exec_queue_snapshot *snapshot)
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.h b/drivers/gpu/drm/xe/xe_guc_submit.h
> index 29abf07d8f04..d3ecca3c8ed5 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.h
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.h
> @@ -41,6 +41,8 @@ int xe_guc_error_capture_handler(struct xe_guc *guc, u32 *msg, u32 len);
>   int xe_guc_exec_queue_cgp_sync_done_handler(struct xe_guc *guc, u32 *msg, u32 len);
>   int xe_guc_exec_queue_cgp_context_error_handler(struct xe_guc *guc, u32 *msg,
>   						u32 len);
> +int xe_guc_context_invalid_semaphore_instruction_field_handler(struct xe_guc *guc,
> +							       u32 *msg, u32 len);
>   
>   struct xe_guc_submit_exec_queue_snapshot *
>   xe_guc_exec_queue_snapshot_capture(struct xe_exec_queue *q);
> diff --git a/drivers/gpu/drm/xe/xe_trace.h b/drivers/gpu/drm/xe/xe_trace.h
> index d4e9d91f6f7f..e52054eccc8d 100644
> --- a/drivers/gpu/drm/xe/xe_trace.h
> +++ b/drivers/gpu/drm/xe/xe_trace.h
> @@ -223,6 +223,11 @@ DEFINE_EVENT(xe_exec_queue, xe_exec_queue_cgp_context_error,
>   	     TP_ARGS(q)
>   );
>   
> +DEFINE_EVENT(xe_exec_queue, xe_guc_invalid_semaphore_instruction_field,
> +	     TP_PROTO(struct xe_exec_queue *q),
> +	     TP_ARGS(q)
> +);
> +
>   DEFINE_EVENT(xe_exec_queue, xe_exec_queue_stop,
>   	     TP_PROTO(struct xe_exec_queue *q),
>   	     TP_ARGS(q)
