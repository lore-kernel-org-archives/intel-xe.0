Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07F40C44500
	for <intel-xe@archiver.kernel.org>; Fri,  3 Jul 2026 12:37:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5C3D10F803;
	Fri,  3 Jul 2026 12:37:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RKQLK31r";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC53D10F7EA
 for <intel-xe@lists.freedesktop.org>; Fri,  3 Jul 2026 12:37:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783082256; x=1814618256;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=8mzLBKTzWsh67idbQ0V702ocSCKh5aMlh1SY8SyptGs=;
 b=RKQLK31rGRMNHFfZt1/71qSrYWxzeQQltbc+6fhUTgPDlVpaC+aWoNzV
 mCnGncXEdmumzvqI0B14erNAl9yoIgkIVCuxi7xCdFQey7rgACyDvxfGh
 esd0/+8AcvCaFcJFhhhriofrZzRteJD/zX/gJQffXGq49RzenTunHcjn9
 YUQzdqjnVs9toLRO9DQ9c0EDGxQzMfDVPmvWPbeonBEjOKnCF8XfCPUlZ
 rcpn1Tpqy6WyMdmreyxDGAHjh6zRHba4HxX+ISzNOaQiaF27dYWFzuEbB
 mU8lUjpxJCKYFfHGPI9V/MaAAPfr6qgMzicC3GN83pzs28lF3tQKyhw0e w==;
X-CSE-ConnectionGUID: TJ0/yLngSbSPESi+yiNgqg==
X-CSE-MsgGUID: +jpQ0WNpQ7SxA9s40obxxg==
X-IronPort-AV: E=McAfee;i="6800,10657,11835"; a="94194670"
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; d="scan'208,217";a="94194670"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2026 05:37:30 -0700
X-CSE-ConnectionGUID: zPWu6lCeRtuwFzP/V6+BGg==
X-CSE-MsgGUID: pBDGtyTTSee7lEnBwYu/kA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; 
 d="scan'208,217";a="252044738"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2026 05:37:31 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 3 Jul 2026 05:37:29 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Fri, 3 Jul 2026 05:37:29 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.59) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 3 Jul 2026 05:37:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DlnEDwPSyvprQ5ryv7v/bIcCSZtjk+KZRc7iFk5guz+Mqy4te07VCyXX+1fHq6zktO37YeU44kLjTjOqKsdB4B3tn6BHXN7XfZF/BafJ/hPDKID0f3BCsxiHztsmA8dTjAEoCEfzJEuI+xJRkDS8MyVEbyLZgPdg46sgwGknwLtKT3dT7EhAxqAqvfDSed29AO0Bin+Cb1qxtvMR1mimoR57h3d7W30SmOfzNHVRjMDDArtZEWG4BVhPuqo4RbGGPFTCv1QfJRN1Is7wMQzfOxGe0c/JPycdN6V6Yd3lzw9MzuYGjAIhZWb73p8ZF7eUIBFQ4Rf/R436S0qoyR/3vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x9kGQ3htA5h7v9aK9Wva5xDSZlF9V2wDJH3/uU7SOTo=;
 b=SUnPx7gH79L9WZle0mgy0kH3a+0XVaxX07MuTnS78HDSnFZwTN1UWjdjCmgJTxynWHhk7PZksJlZSyXl8KT2bb+2F1oLaMfn0wQRur8bSr80/tnSLgT0Z00ZSE8yaA/+a7R6vAok5Li10yFJK/vm9bkcgJug63CZXBevBUesxSWTNF1rXuPT7zDrcElMDw7PZchiSvU9wSEniFjNbjY0zxE3A6/701/LmGBSQgEiF24tAgZ3YN/7H4Ffbc5FlD6JUYh/n4Cbi+czxOD9IYiLLAF0goV9q2Pw5UrrNnGeRkCQHQHqL39fqDf+5CzCgMRhPwSOzNp6FsFtMw1OoymeHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6207.namprd11.prod.outlook.com (2603:10b6:208:3c5::21)
 by SJ2PR11MB8568.namprd11.prod.outlook.com (2603:10b6:a03:56c::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.9; Fri, 3 Jul 2026
 12:37:27 +0000
Received: from MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d]) by MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d%5]) with mapi id 15.21.0181.008; Fri, 3 Jul 2026
 12:37:26 +0000
Content-Type: multipart/alternative;
 boundary="------------RFwTVIJYtDUXrywDIG6ca0N0"
Message-ID: <8928dbb2-2164-4588-8103-37b8748b8697@intel.com>
Date: Fri, 3 Jul 2026 18:07:19 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8] drm/xe: Consolidate debugfs fault injection functions.
To: "Tauro, Riana" <riana.tauro@intel.com>, <intel-xe@lists.freedesktop.org>, 
 <rodrigo.vivi@intel.com>, <anshuman.gupta@intel.com>
CC: <badal.nilawar@intel.com>, <vinay.belgaumkar@intel.com>,
 <karthik.poosa@intel.com>, <sk.anirban@intel.com>, <raag.jadav@intel.com>,
 <matthew.brost@intel.com>
References: <20260616052931.72692-2-mallesh.koujalagi@intel.com>
 <22674c40-790e-4ee9-bcf6-8e118db2ea69@intel.com>
 <620aaf83-10de-4d33-b1e2-b5da5291d85b@intel.com>
 <ed21cb87-54c2-44e9-a534-e99a29c413de@intel.com>
Content-Language: en-US
From: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>
In-Reply-To: <ed21cb87-54c2-44e9-a534-e99a29c413de@intel.com>
X-ClientProxiedBy: MA5PR01CA0098.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1a8::10) To MN0PR11MB6207.namprd11.prod.outlook.com
 (2603:10b6:208:3c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6207:EE_|SJ2PR11MB8568:EE_
X-MS-Office365-Filtering-Correlation-Id: fb5a97c5-7d39-40b4-4c4c-08ded8ffd6b8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|1800799024|366016|22082099003|4143699003|56012099006|18002099003|6133799003|8096899003|11063799006;
X-Microsoft-Antispam-Message-Info: CtiDykz+aFG+xI1VsAg5RTiD29tQvrinFPIIYvX2P2old3INyWVyg9skzIA1AwuY7zo92gdrxvJOtMfWlR3R1z+01VLakeJ7IqMWZTUJAJ/TLRLkOn0vS8jh2bBWdXo5xwXIoghrFxqN91WEUe6GtNh/gzYOAHcuFKa8cNRzy5cdBD5UWrxM6FeQq8wnf+6WuHR6cFDwusQOKkJsVtSHNtdTRyYtXzANMDw2o2sl3R2dKnhq6aCi69HvolE/JtNPiTrbPfNkZ08Pak6FekpVipv8/NqzkonFyAAp9Gfa1U+Vy5wm0TnKrK0ZO6Vl12ANh4rgYTj9+dX9fM70s7x5FKqv1riWgUaDQvNdPgPypRasnU5q5gPfhXS84DlcSdeTD99RkcCV9TNB+DB6S5fb7WlQX4A7KDiPoZlPw4cC+IF14J8H/c7zf12eeAGe35WOSNsUMCYjV1aokviA9SV3XLGBjZvn49j8U2CyApZAqUcc7qYiNUoFPW8vWn6RZdsgFbtCiPcN+7VA6CJzLWfmxRzINgrFT2GD1fr4GcgE0ZIuiDfR+GrJN9Yg84BFyuPMjMdA+i/cBAIDT/TqQ1Sa7je6kVjDpVXAMc5TB+Sev652lwlgsXN/o2DN0vlpaxvSiTzY6UUtb1acR500JtX9OxmFKnmKtAUWBzCcgdrikmA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6207.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(22082099003)(4143699003)(56012099006)(18002099003)(6133799003)(8096899003)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NHNNNWpTbjBybnJNbkNBc1c3VVhEVkhOSndtTC84UlV1M01UZWFmUnJLQVEz?=
 =?utf-8?B?VnRaSS9ZNUpmWVZscjh1WkEraS9qblRlWGxOMVVEc0tSTWs2eW9LZnFhS2FX?=
 =?utf-8?B?cXhtRWVEbUV1dUh0OXE2SEExcHdQNmZpb20xdkNIRHNVTFk3K1lXOWJqdWtM?=
 =?utf-8?B?SXRMZHdrUWlYSjJ3d09ZVERFOEpUV1FWUWxYVktsNjVFZU41QWF6czkwTzky?=
 =?utf-8?B?MWVsblN0WEFoSnNHL2diQTdIM3FZVklsNGZFK2RVeXdmQS9EeW1zNE05bjFw?=
 =?utf-8?B?czJVeXFCRWVmOGxMcEhQcnpvT28wQ1hpM1dJZ1k2ZWl0MWpudDR4SWl5Ykl1?=
 =?utf-8?B?bFBHRFZ6N3dlSVl2TllINnZXcjhlVVVsd2MvMHlleGl1a25hWjFhU00wQzcx?=
 =?utf-8?B?OGFaZlhmQkZ0dXNVemcwb010VDA4R1ZpR0xRa2ZOeHdXVmRFU3FySDZ6dUYy?=
 =?utf-8?B?ZTE5elFaR2NLTGVGWFp5VFZ3d2NtVjRES1E1ei96dnR6eGhtQndXSWdxSkJB?=
 =?utf-8?B?V3J6UXVBb3VRUHZQc3YrZHFLRDNGYlhiUHluclZOamZnZGIxVENmT2MvYnlj?=
 =?utf-8?B?akU1WG5wV0JuQ1pvR25PTm4zSWhoN1pVY3lKSHNlVHd1eFN1WDB2YnJMWEVj?=
 =?utf-8?B?UTVGU2tNYlhrcmU3Mi9yZEpJZ2ZkQW9ERU5rY1RUa2NPWW0wZkc5dStNT2sr?=
 =?utf-8?B?dmRaQ1FBRmpKZWpyY1lBaGg1Y0hEbXpGcWwwN2RQaURNTlJkNm5Nakw2NVFE?=
 =?utf-8?B?OW44SVRXWXpGM0ZvZ2sweVhmUVVkT2lhQTFkd0tscGdUVUx5NkFqVzhjd2Nm?=
 =?utf-8?B?WTREUVVBRWZqRXpUM1lITkdEa0NBNWdTb2xhZCtmdmhFUXN3cENPazYvTEhO?=
 =?utf-8?B?QU4wTlNzY2F1VTk3a3orRWV5S2ljMm1QWi9KZWtDTVVQTTBBcnNsWS9yUS95?=
 =?utf-8?B?S0FsYTkzRDI1WmZhWWp1YlMvZjNtVXYwckowdU1KSWs5a0lYenU4WnNBYXFk?=
 =?utf-8?B?Z3lpcjgxSWxLSERtejJucFlPQVc2cEFyL3JvTTFtSkdLZWczT0xSUGpqTkJF?=
 =?utf-8?B?NXJBUCszSjNmRTJGYVVwbVlhS3poRTRKS09IemFnK2gyOURaQ2pDR3dFdmpp?=
 =?utf-8?B?ZGp2b0xvVFpNazJqemVwVzRsZU1qNnJra2FGSjlsSGd6ZTJERTdZZ3l4c3RX?=
 =?utf-8?B?TzBhR1l5VDhkMW03SHM3Q3lGSzZ0RXRVRW5XQ0ViMGdiTGNXTi9BVUlaMjRz?=
 =?utf-8?B?MFNROUtuVG94SjNjRVVpVHFyUWNXU2ZPY2F5WDllNUJQVHhrUm95eS9pR0xC?=
 =?utf-8?B?ZWhObWlCL0NySXlRR1gxOTdhSjdYK1NaakZjZFFnUEROQW9xZjJhdjNlWEx5?=
 =?utf-8?B?VXZNVXBHaVpVcERYSGF3Q0JUaHR5S3o1a1UrTGVVYXpiUHNJRG1ETGltd1FM?=
 =?utf-8?B?Q0NQbUVJc0VqSDdCVmpjTHgra3hkZk1NdStJWCtDTTE1Y2UzenR2dkY4cFlz?=
 =?utf-8?B?dVorN1dxYjB1Unl1d3MzNWM4aU9GVjh2VnlqRUczNU45U29mQWczOUdNTDlM?=
 =?utf-8?B?TUZHUHNkNk9OTkk2a1poV21tSTllTS9TQ1pXZmxIRUo4cWo3dHcyR2VlZXVz?=
 =?utf-8?B?WExkODNsVEc1alRUb3o0QTA4cWwvVmVWUGdvei9Fb3RudElJVTdKNEE0T3Yy?=
 =?utf-8?B?Z2FYVkVuK3FoRjBPT0pWZ3pjaFcyMllqRGxqcXJSd3NYa2tUQks0SlJ4TjEy?=
 =?utf-8?B?QnFYZDM0bEJ0WFFVUWNjQUpqZ01NdEg0U20xYU4yeFp5TEJWWmZlK1ZQbklE?=
 =?utf-8?B?WWJ6aUFmbVRCNVhhZWtHNkI3Q0hRL0dMLzVuOUNVTDJiYzAzcVV0ZzYyY29v?=
 =?utf-8?B?RlRBdExKMzQ3amNiYlNsRlRENHhLOE5yNHhhZTBmMEYwWGd2bWdDTHhMRjlM?=
 =?utf-8?B?cFBKODdaUEpVbnlUdHJrVXk4UlhEYVF1eFdFQnp2QVF0eTZ1N21DS1cxV2R3?=
 =?utf-8?B?bDg5UHhiV05FTWVqRlVtR28wZWtKSkp3TjZHK0JST2lqVnRpRHR6Tjk2SDhJ?=
 =?utf-8?B?SS9LRDBzU2QvVFZCOTkwZXllMWlOdVJnTnBtRFA1RFd6bEFBWklRS2VTbmRS?=
 =?utf-8?B?V1F4MHVoamNlaUU4RmdFaVdvTEszeTh2czBvNlNtbytkTHJoVzAxMm5tcm9R?=
 =?utf-8?B?Q0xDWnFQTlJibHBTSUtSRlVnWlYrYkZ5eVlzWkZGWmdlT09VOGhOUGpRZjVG?=
 =?utf-8?B?Q3ZpZStBMTArRWx2MGlEZ2ZjbXFWUC9XNnhHZ0wvVklOek4xaWIwK1oyQ1Jk?=
 =?utf-8?B?SW9idGJoSlVrMHJlcnJqZFU0Y0U2cVhEMzB0aVdQdXUyZnlleUIyUjI4SEFU?=
 =?utf-8?Q?vLfJo8/x8ERq3JfE=3D?=
X-Exchange-RoutingPolicyChecked: dZxSaMIzBXNBVepWfM+pcU64nYGmjY4RPu8blxwHbpclhK+FAB+m+UdKnUIp5+y2jIDHLVNRwveDKnUjAMabLgHSdSlX3REjElI4J1NSawlVRow209Bnedh6tn9zeeVkUifUo5xs8dQZ+24YvxXh/HJBsNt7vkS8IKhphnULumYJE6ZPIko66YrSwabm78glQ6hNNn4muUcP+I+YoHcAq+SQDz7tS9pgVd4hxf7W6k+HiZTgu71n8XcjFp1Vv3lJi1oEiI+zyMhhBWMSCBYwYk5XJORpTEGw9XWwzzCmodr9SyVF8Jbrp8mxMyinYvm0J7QgXyH3KoNYCHRGkkmJcg==
X-MS-Exchange-CrossTenant-Network-Message-Id: fb5a97c5-7d39-40b4-4c4c-08ded8ffd6b8
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6207.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2026 12:37:26.7473 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 99xpjlEudhXjJWzKyQQuslEYM2ihw8DwO5kE/PcKuMKqmf14pSr6dDwQuhXMHppGbpCBmxBoXyBijjcfK8NXxUUnIeDH1kS2uYTSCy9IIbs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8568
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

--------------RFwTVIJYtDUXrywDIG6ca0N0
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit


On 03-07-2026 06:02 pm, Tauro, Riana wrote:
>
> On 03-07-2026 17:48, Mallesh, Koujalagi wrote:
>>
>> On 03-07-2026 12:47 pm, Tauro, Riana wrote:
>>>
>>> On 16-06-2026 10:59, Mallesh Koujalagi wrote:
>>>> The fault injection code was scattered: the GT reset
>>>> hook lived in xe_gt.h as an inline function with its own global
>>>> variable, the CSC hook had a separate global in xe_hw_error.c with
>>>> an extern declaration, and each was individually registered in
>>>> xe_debugfs.c. Adding a new error type meant editing many files and
>>>> copy-pasting the same boilerplate.
>>>>
>>>> Debugfs interface (under /sys/kernel/debug/dri/0/):
>>>>   - fail_gt_reset         - GT reset failure
>>>>   - inject_csc_hw_error   - CSC firmware error
>>>>
>>>> Signed-off-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
>>>> Reviewed-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
>>>> ---
>>>> v2:
>>>> - Add multiple platform support. (Vinay)
>>>> - Handle VF properly.
>>>> - Rename to XE_FAULT_GT_RESET/XE_FAULT_CSC_HW_ERROR and
>>>>    create xe_fault_inject_types.h file including those name.
>>>>
>>>> v3:
>>>> - Solved patch apply issue on tip.
>>>>
>>>> v4:
>>>> - Add proper header file.
>>>>
>>>> v5:
>>>> - Properly refer FAULT_ATTR_INITIALIZER. (Vinay)
>>>> - Change xe_fault_inject_descs to xe_fault_inject_entry.
>>>> - Change 2025 to 2026.
>>>>
>>>> v6:
>>>> - Change return comments of xe_fault_inject(). (Riana)
>>>> - Remove full description of xe_fault_inject_debugfs_register().
>>>>
>>>> v7:
>>>> - Move all fault inject helper functions in xe_debugfs.c (Riana)
>>>> - Update commit message.
>>>>
>>>> v8:
>>>> - Assign .attr pointer with DECLARE_FAULT_ATTR macro. (Riana)
>>>> - Remove CONFIG_FAULT_INJECTION block.
>>>> ---
>>>>   drivers/gpu/drm/xe/xe_debugfs.c  | 45 
>>>> +++++++++++++++++++++++++++++---
>>>>   drivers/gpu/drm/xe/xe_debugfs.h  | 16 ++++++++++++
>>>>   drivers/gpu/drm/xe/xe_gt.c       |  5 ++--
>>>>   drivers/gpu/drm/xe/xe_gt.h       |  8 ------
>>>>   drivers/gpu/drm/xe/xe_hw_error.c | 11 ++------
>>>>   5 files changed, 63 insertions(+), 22 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/xe/xe_debugfs.c 
>>>> b/drivers/gpu/drm/xe/xe_debugfs.c
>>>> index 22b471303984..b3899bedf70b 100644
>>>> --- a/drivers/gpu/drm/xe/xe_debugfs.c
>>>> +++ b/drivers/gpu/drm/xe/xe_debugfs.c
>>>> @@ -5,6 +5,7 @@
>>>>     #include "xe_debugfs.h"
>>>>   +#include <linux/bits.h>
>>>>   #include <linux/debugfs.h>
>>>>   #include <linux/fault-inject.h>
>>>>   #include <linux/string_helpers.h>
>>>> @@ -41,6 +42,46 @@
>>>>   DECLARE_FAULT_ATTR(gt_reset_failure);
>>>>   DECLARE_FAULT_ATTR(inject_csc_hw_error);
>>>>   +static struct {
>>>> +    const char *name;
>>>> +    u32 platforms;
>>>> +    bool skip_on_vf;
>>>> +    struct fault_attr *attr;
>>>> +} xe_fault_inject_entry[XE_FAULT_MAX] = {
>>>> +    [XE_FAULT_GT_RESET]    = { .name = "fail_gt_reset",
>>>> +                    .attr = &gt_reset_failure },
>>>> +    [XE_FAULT_CSC_HW_ERROR]    = { .name = "inject_csc_hw_error",
>>>> +                    .platforms = BIT(XE_BATTLEMAGE),
>>>> +                    .skip_on_vf = true,
>>>> +                    .attr = &inject_csc_hw_error },
>>>
>>>
>>> Here are my concerns with this patch before merging
>>>
>>>
>>> I'm not fully convinced by this structure.
>>> As we add more types in the future — fault injection that depends on 
>>> sysctrl, guc
>>> or anything else. This will keep accumulating.
>>>
>> That's a valid concern. Right now, the struct keeps adding separate 
>> filter fields (such as platforms and skip_on_vf)
>>
>> for each entry. If we introduce new checks like GuC readiness, SysCtl 
>> state, or GT generation, we'll need to keep
>>
>> adding more fields.
>>
>> A cleaner and more scalable approach is to replace these individual 
>> filter fields
>>
>> with a single availability callback that handles all dependency 
>> checks in one place.
>>
>> This keeps the struct fixed and makes it easier to extend in the future.
>
>
> Can you please provide a snippet on what this means?

Sure!, here is code snippet:

+static bool csc_hw_error_available(struct xe_device *xe)
+{
+       return !IS_SRIOV_VF(xe) && xe->info.platform == XE_BATTLEMAGE;
+}
+
  static struct {
         const char *name;
-       u32 platforms;
-       bool skip_on_vf;
+       bool (*available)(struct xe_device *xe);
         struct fault_attr *attr;
  } xe_fault_inject_entry[XE_FAULT_MAX] = {
         [XE_FAULT_GT_RESET]     = { .name = "fail_gt_reset",
                                     .attr = &gt_reset_failure },
         [XE_FAULT_CSC_HW_ERROR] = { .name = "inject_csc_hw_error",
-                                   .platforms = BIT(XE_BATTLEMAGE),
-                                   .skip_on_vf = true,
+ *   .available = csc_hw_error_available,*
                                     .attr = &inject_csc_hw_error },
  };

Thanks,

-/Mallesh

>
> Thanks
> Riana
>
>>
>> Please let me know your thoughts or if you have any comments on this 
>> approach.
>>
>>>> +};
>>>> +
>>>> +bool xe_fault_inject(enum xe_fault_type type)
>>>> +{
>>>> +    if (type >= XE_FAULT_MAX)
>>>> +        return false;
>>>> +
>>>> +    return should_fail(xe_fault_inject_entry[type].attr, 1);
>>>> +}
>>>> +
>>>> +static void xe_fault_inject_debugfs_register(struct xe_device *xe,
>>>> +                         struct dentry *root)
>>>> +{
>>>> +    int i;
>>>> +
>>>> +    for (i = 0; i < XE_FAULT_MAX; i++) {
>>>> +        if (IS_SRIOV_VF(xe) && xe_fault_inject_entry[i].skip_on_vf)
>>>> +            continue;
>>>> +
>>>> +        if (xe_fault_inject_entry[i].platforms &&
>>>> +            !(xe_fault_inject_entry[i].platforms & 
>>>> BIT(xe->info.platform)))
>>>> +            continue;
>>>> +
>>>> + fault_create_debugfs_attr(xe_fault_inject_entry[i].name, root,
>>>> +                      xe_fault_inject_entry[i].attr);
>>>> +    }
>>>> +}
>>>> +
>>>>   static void read_residency_counter(struct xe_device *xe, struct 
>>>> xe_mmio *mmio,
>>>>                      u32 offset, const char *name, struct 
>>>> drm_printer *p)
>>>>   {
>>>> @@ -563,8 +604,6 @@ void xe_debugfs_register(struct xe_device *xe)
>>>>           drm_debugfs_create_files(debugfs_residencies,
>>>>                        ARRAY_SIZE(debugfs_residencies),
>>>>                        root, minor);
>>>> -        fault_create_debugfs_attr("inject_csc_hw_error", root,
>>>> -                      &inject_csc_hw_error);
>>>>       }
>>>>         debugfs_create_file("forcewake_all", 0400, root, xe,
>>>> @@ -610,7 +649,7 @@ void xe_debugfs_register(struct xe_device *xe)
>>>>         xe_psmi_debugfs_register(xe);
>>>>   -    fault_create_debugfs_attr("fail_gt_reset", root, 
>>>> &gt_reset_failure);
>>>> +    xe_fault_inject_debugfs_register(xe, root);
>>>>         if (IS_SRIOV_PF(xe))
>>>>           xe_sriov_pf_debugfs_register(xe, root);
>>>> diff --git a/drivers/gpu/drm/xe/xe_debugfs.h 
>>>> b/drivers/gpu/drm/xe/xe_debugfs.h
>>>> index 17f4c2f1b5e4..beedc7ebdaaa 100644
>>>> --- a/drivers/gpu/drm/xe/xe_debugfs.h
>>>> +++ b/drivers/gpu/drm/xe/xe_debugfs.h
>>>> @@ -6,8 +6,24 @@
>>>>   #ifndef _XE_DEBUGFS_H_
>>>>   #define _XE_DEBUGFS_H_
>>>>   +#include <linux/types.h>
>>>> +
>>>>   struct xe_device;
>>>>   +/**
>>>> + * enum xe_fault_type - Fault injection types
>>>> + * @XE_FAULT_GT_RESET: GT reset failure injection
>>>> + * @XE_FAULT_CSC_HW_ERROR: CSC hardware error injection
>>>> + * @XE_FAULT_MAX: Number of fault injection types
>>>> + */
>>>> +enum xe_fault_type {
>>>> +    XE_FAULT_GT_RESET,
>>>> +    XE_FAULT_CSC_HW_ERROR,
>>>> +    XE_FAULT_MAX
>>>> +};
>>>
>>> I would still prefer an abstracted function.
>>>
>> Sure! We can define a named macro for each fault type, such as 
>> xe_fault_gt_reset() and xe_fault_csc_hw_error(),
>>
>> as thin wrappers around a common dispatcher like
>>
>> #define xe_fault_gt_reset() xe_fault_inject(XE_FAULT_GT_RESET)
>>
>>
>> Thanks,
>>
>> -/Mallesh
>>
>>>
>>> Thanks
>>> Riana
>>>
>>>> +
>>>> +bool xe_fault_inject(enum xe_fault_type type);
>>>> +
>>>>   #ifdef CONFIG_DEBUG_FS
>>>>   void xe_debugfs_register(struct xe_device *xe);
>>>>   #else
>>>> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
>>>> index 783eb6d631b5..eda8df8adf11 100644
>>>> --- a/drivers/gpu/drm/xe/xe_gt.c
>>>> +++ b/drivers/gpu/drm/xe/xe_gt.c
>>>> @@ -21,6 +21,7 @@
>>>>   #include "regs/xe_gt_regs.h"
>>>>   #include "xe_assert.h"
>>>>   #include "xe_bb.h"
>>>> +#include "xe_debugfs.h"
>>>>   #include "xe_device.h"
>>>>   #include "xe_eu_stall.h"
>>>>   #include "xe_exec_queue.h"
>>>> @@ -923,7 +924,7 @@ static void gt_reset_worker(struct work_struct *w)
>>>>         xe_gt_info(gt, "reset started\n");
>>>>   -    if (xe_fault_inject_gt_reset()) {
>>>> +    if (xe_fault_inject(XE_FAULT_GT_RESET)) {
>>>>           err = -ECANCELED;
>>>>           goto err_fail;
>>>>       }
>>>> @@ -980,7 +981,7 @@ void xe_gt_reset_async(struct xe_gt *gt)
>>>>       xe_gt_info(gt, "trying reset from %ps\n", 
>>>> __builtin_return_address(0));
>>>>         /* Don't do a reset while one is already in flight */
>>>> -    if (!xe_fault_inject_gt_reset() && xe_uc_reset_prepare(&gt->uc))
>>>> +    if (!xe_fault_inject(XE_FAULT_GT_RESET) && 
>>>> xe_uc_reset_prepare(&gt->uc))
>>>>           return;
>>>>         xe_gt_info(gt, "reset queued\n");
>>>> diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
>>>> index 4150aa594f05..f8e3ca63aabb 100644
>>>> --- a/drivers/gpu/drm/xe/xe_gt.h
>>>> +++ b/drivers/gpu/drm/xe/xe_gt.h
>>>> @@ -6,8 +6,6 @@
>>>>   #ifndef _XE_GT_H_
>>>>   #define _XE_GT_H_
>>>>   -#include <linux/fault-inject.h>
>>>> -
>>>>   #include <drm/drm_util.h>
>>>>     #include "xe_device.h"
>>>> @@ -38,12 +36,6 @@
>>>>       xe_gt_is_media_type(gt_) ? MEDIA_VER(xe) : GRAPHICS_VER(xe); \
>>>>   })
>>>>   -extern struct fault_attr gt_reset_failure;
>>>> -static inline bool xe_fault_inject_gt_reset(void)
>>>> -{
>>>> -    return IS_ENABLED(CONFIG_DEBUG_FS) && 
>>>> should_fail(&gt_reset_failure, 1);
>>>> -}
>>>> -
>>>>   struct xe_gt *xe_gt_alloc(struct xe_tile *tile);
>>>>   int xe_gt_init_early(struct xe_gt *gt);
>>>>   int xe_gt_init(struct xe_gt *gt);
>>>> diff --git a/drivers/gpu/drm/xe/xe_hw_error.c 
>>>> b/drivers/gpu/drm/xe/xe_hw_error.c
>>>> index 4b72959b2276..bdbf87eb743d 100644
>>>> --- a/drivers/gpu/drm/xe/xe_hw_error.c
>>>> +++ b/drivers/gpu/drm/xe/xe_hw_error.c
>>>> @@ -4,7 +4,6 @@
>>>>    */
>>>>     #include <linux/bitmap.h>
>>>> -#include <linux/fault-inject.h>
>>>>     #include "regs/xe_gsc_regs.h"
>>>>   #include "regs/xe_hw_error_regs.h"
>>>> @@ -12,6 +11,7 @@
>>>>     #include "xe_device.h"
>>>>   #include "xe_drm_ras.h"
>>>> +#include "xe_debugfs.h"
>>>>   #include "xe_hw_error.h"
>>>>   #include "xe_mmio.h"
>>>>   #include "xe_survivability_mode.h"
>>>> @@ -25,8 +25,6 @@
>>>>                            (PVC_COR_ERR_MASK & REG_BIT(err_bit)) : \
>>>>                            (PVC_FAT_ERR_MASK & REG_BIT(err_bit)))
>>>>   -extern struct fault_attr inject_csc_hw_error;
>>>> -
>>>>   static const char * const error_severity[] = 
>>>> DRM_XE_RAS_ERROR_SEVERITY_NAMES;
>>>>     static const char * const hec_uncorrected_fw_errors[] = {
>>>> @@ -167,11 +165,6 @@ 
>>>> static_assert(ARRAY_SIZE(pvc_master_local_nonfatal_err_reg) == 
>>>> XE_RAS_REG_SIZE);
>>>>                            pvc_master_local_fatal_err_reg : \
>>>> pvc_master_local_nonfatal_err_reg)
>>>>   -static bool fault_inject_csc_hw_error(void)
>>>> -{
>>>> -    return IS_ENABLED(CONFIG_DEBUG_FS) && 
>>>> should_fail(&inject_csc_hw_error, 1);
>>>> -}
>>>> -
>>>>   static void csc_hw_error_work(struct work_struct *work)
>>>>   {
>>>>       struct xe_tile *tile = container_of(work, typeof(*tile), 
>>>> csc_hw_error_work);
>>>> @@ -507,7 +500,7 @@ void xe_hw_error_irq_handler(struct xe_tile 
>>>> *tile, const u32 master_ctl)
>>>>   {
>>>>       enum hardware_error hw_err;
>>>>   -    if (fault_inject_csc_hw_error())
>>>> +    if (xe_fault_inject(XE_FAULT_CSC_HW_ERROR))
>>>>           schedule_work(&tile->csc_hw_error_work);
>>>>         for (hw_err = 0; hw_err < HARDWARE_ERROR_MAX; hw_err++) {
--------------RFwTVIJYtDUXrywDIG6ca0N0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 03-07-2026 06:02 pm, Tauro, Riana
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:ed21cb87-54c2-44e9-a534-e99a29c413de@intel.com">
      <br>
      On 03-07-2026 17:48, Mallesh, Koujalagi wrote:
      <br>
      <blockquote type="cite">
        <br>
        On 03-07-2026 12:47 pm, Tauro, Riana wrote:
        <br>
        <blockquote type="cite">
          <br>
          On 16-06-2026 10:59, Mallesh Koujalagi wrote:
          <br>
          <blockquote type="cite">The fault injection code was
            scattered: the GT reset
            <br>
            hook lived in xe_gt.h as an inline function with its own
            global
            <br>
            variable, the CSC hook had a separate global in
            xe_hw_error.c with
            <br>
            an extern declaration, and each was individually registered
            in
            <br>
            xe_debugfs.c. Adding a new error type meant editing many
            files and
            <br>
            copy-pasting the same boilerplate.
            <br>
            <br>
            Debugfs interface (under /sys/kernel/debug/dri/0/):
            <br>
            &nbsp; - fail_gt_reset&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - GT reset failure
            <br>
            &nbsp; - inject_csc_hw_error&nbsp;&nbsp; - CSC firmware error
            <br>
            <br>
            Signed-off-by: Mallesh Koujalagi
            <a class="moz-txt-link-rfc2396E" href="mailto:mallesh.koujalagi@intel.com">&lt;mallesh.koujalagi@intel.com&gt;</a>
            <br>
            Reviewed-by: Vinay Belgaumkar
            <a class="moz-txt-link-rfc2396E" href="mailto:vinay.belgaumkar@intel.com">&lt;vinay.belgaumkar@intel.com&gt;</a>
            <br>
            ---
            <br>
            v2:
            <br>
            - Add multiple platform support. (Vinay)
            <br>
            - Handle VF properly.
            <br>
            - Rename to XE_FAULT_GT_RESET/XE_FAULT_CSC_HW_ERROR and
            <br>
            &nbsp;&nbsp; create xe_fault_inject_types.h file including those name.
            <br>
            <br>
            v3:
            <br>
            - Solved patch apply issue on tip.
            <br>
            <br>
            v4:
            <br>
            - Add proper header file.
            <br>
            <br>
            v5:
            <br>
            - Properly refer FAULT_ATTR_INITIALIZER. (Vinay)
            <br>
            - Change xe_fault_inject_descs to xe_fault_inject_entry.
            <br>
            - Change 2025 to 2026.
            <br>
            <br>
            v6:
            <br>
            - Change return comments of xe_fault_inject(). (Riana)
            <br>
            - Remove full description of
            xe_fault_inject_debugfs_register().
            <br>
            <br>
            v7:
            <br>
            - Move all fault inject helper functions in xe_debugfs.c
            (Riana)
            <br>
            - Update commit message.
            <br>
            <br>
            v8:
            <br>
            - Assign .attr pointer with DECLARE_FAULT_ATTR macro.
            (Riana)
            <br>
            - Remove CONFIG_FAULT_INJECTION block.
            <br>
            ---
            <br>
            &nbsp; drivers/gpu/drm/xe/xe_debugfs.c&nbsp; | 45
            +++++++++++++++++++++++++++++---
            <br>
            &nbsp; drivers/gpu/drm/xe/xe_debugfs.h&nbsp; | 16 ++++++++++++
            <br>
            &nbsp; drivers/gpu/drm/xe/xe_gt.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 5 ++--
            <br>
            &nbsp; drivers/gpu/drm/xe/xe_gt.h&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 8 ------
            <br>
            &nbsp; drivers/gpu/drm/xe/xe_hw_error.c | 11 ++------
            <br>
            &nbsp; 5 files changed, 63 insertions(+), 22 deletions(-)
            <br>
            <br>
            diff --git a/drivers/gpu/drm/xe/xe_debugfs.c
            b/drivers/gpu/drm/xe/xe_debugfs.c
            <br>
            index 22b471303984..b3899bedf70b 100644
            <br>
            --- a/drivers/gpu/drm/xe/xe_debugfs.c
            <br>
            +++ b/drivers/gpu/drm/xe/xe_debugfs.c
            <br>
            @@ -5,6 +5,7 @@
            <br>
            &nbsp; &nbsp; #include &quot;xe_debugfs.h&quot;
            <br>
            &nbsp; +#include &lt;linux/bits.h&gt;
            <br>
            &nbsp; #include &lt;linux/debugfs.h&gt;
            <br>
            &nbsp; #include &lt;linux/fault-inject.h&gt;
            <br>
            &nbsp; #include &lt;linux/string_helpers.h&gt;
            <br>
            @@ -41,6 +42,46 @@
            <br>
            &nbsp; DECLARE_FAULT_ATTR(gt_reset_failure);
            <br>
            &nbsp; DECLARE_FAULT_ATTR(inject_csc_hw_error);
            <br>
            &nbsp; +static struct {
            <br>
            +&nbsp;&nbsp;&nbsp; const char *name;
            <br>
            +&nbsp;&nbsp;&nbsp; u32 platforms;
            <br>
            +&nbsp;&nbsp;&nbsp; bool skip_on_vf;
            <br>
            +&nbsp;&nbsp;&nbsp; struct fault_attr *attr;
            <br>
            +} xe_fault_inject_entry[XE_FAULT_MAX] = {
            <br>
            +&nbsp;&nbsp;&nbsp; [XE_FAULT_GT_RESET]&nbsp;&nbsp;&nbsp; = { .name = &quot;fail_gt_reset&quot;,
            <br>
            +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .attr = &amp;gt_reset_failure },
            <br>
            +&nbsp;&nbsp;&nbsp; [XE_FAULT_CSC_HW_ERROR]&nbsp;&nbsp;&nbsp; = { .name =
            &quot;inject_csc_hw_error&quot;,
            <br>
            +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .platforms = BIT(XE_BATTLEMAGE),
            <br>
            +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .skip_on_vf = true,
            <br>
            +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .attr = &amp;inject_csc_hw_error },
            <br>
          </blockquote>
          <br>
          <br>
          Here are my concerns with this patch before merging
          <br>
          <br>
          <br>
          I'm not fully convinced by this structure.
          <br>
          As we add more types in the future — fault injection that
          depends on sysctrl, guc
          <br>
          or anything else. This will keep accumulating.
          <br>
          <br>
        </blockquote>
        That's a valid concern. Right now, the struct keeps adding
        separate filter fields (such as platforms and skip_on_vf)
        <br>
        <br>
        for each entry. If we introduce new checks like GuC readiness,
        SysCtl state, or GT generation, we'll need to keep
        <br>
        <br>
        adding more fields.
        <br>
        <br>
        A cleaner and more scalable approach is to replace these
        individual filter fields
        <br>
        <br>
        with a single availability callback that handles all dependency
        checks in one place.
        <br>
        <br>
        This keeps the struct fixed and makes it easier to extend in the
        future.
        <br>
      </blockquote>
      <br>
      <br>
      Can you please provide a snippet on what this means?
      <br>
    </blockquote>
    <p>Sure!, here is code snippet:</p>
    <p>+static bool csc_hw_error_available(struct xe_device *xe)<br>
      +{<br>
      +&nbsp; &nbsp; &nbsp; &nbsp;return !IS_SRIOV_VF(xe) &amp;&amp; xe-&gt;info.platform ==
      XE_BATTLEMAGE;<br>
      +}<br>
      +<br>
      &nbsp;static struct {<br>
      &nbsp; &nbsp; &nbsp; &nbsp; const char *name;<br>
      -&nbsp; &nbsp; &nbsp; &nbsp;u32 platforms;<br>
      -&nbsp; &nbsp; &nbsp; &nbsp;bool skip_on_vf;<br>
      +&nbsp; &nbsp; &nbsp; &nbsp;bool (*available)(struct xe_device *xe);<br>
      &nbsp; &nbsp; &nbsp; &nbsp; struct fault_attr *attr;<br>
      &nbsp;} xe_fault_inject_entry[XE_FAULT_MAX] = {<br>
      &nbsp; &nbsp; &nbsp; &nbsp; [XE_FAULT_GT_RESET]&nbsp; &nbsp; &nbsp;= { .name = &quot;fail_gt_reset&quot;,<br>
      &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; .attr = &amp;gt_reset_failure
      },<br>
      &nbsp; &nbsp; &nbsp; &nbsp; [XE_FAULT_CSC_HW_ERROR] = { .name = &quot;inject_csc_hw_error&quot;,<br>
      -&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.platforms =
      BIT(XE_BATTLEMAGE),<br>
      -&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.skip_on_vf = true,<br>
      +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<b> &nbsp; &nbsp;.available =
        csc_hw_error_available,</b><br>
      &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; .attr =
      &amp;inject_csc_hw_error },<br>
      &nbsp;};</p>
    <p>Thanks,</p>
    <p>-/Mallesh</p>
    <blockquote type="cite" cite="mid:ed21cb87-54c2-44e9-a534-e99a29c413de@intel.com"><br>
      Thanks
      <br>
      Riana
      <br>
      <br>
      <blockquote type="cite">
        <br>
        Please let me know your thoughts or if you have any comments on
        this approach.
        <br>
        <br>
        <blockquote type="cite">
          <blockquote type="cite">+};
            <br>
            +
            <br>
            +bool xe_fault_inject(enum xe_fault_type type)
            <br>
            +{
            <br>
            +&nbsp;&nbsp;&nbsp; if (type &gt;= XE_FAULT_MAX)
            <br>
            +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return false;
            <br>
            +
            <br>
            +&nbsp;&nbsp;&nbsp; return should_fail(xe_fault_inject_entry[type].attr,
            1);
            <br>
            +}
            <br>
            +
            <br>
            +static void xe_fault_inject_debugfs_register(struct
            xe_device *xe,
            <br>
            +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct dentry *root)
            <br>
            +{
            <br>
            +&nbsp;&nbsp;&nbsp; int i;
            <br>
            +
            <br>
            +&nbsp;&nbsp;&nbsp; for (i = 0; i &lt; XE_FAULT_MAX; i++) {
            <br>
            +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (IS_SRIOV_VF(xe) &amp;&amp;
            xe_fault_inject_entry[i].skip_on_vf)
            <br>
            +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; continue;
            <br>
            +
            <br>
            +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (xe_fault_inject_entry[i].platforms &amp;&amp;
            <br>
            +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; !(xe_fault_inject_entry[i].platforms &amp;
            BIT(xe-&gt;info.platform)))
            <br>
            +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; continue;
            <br>
            +
            <br>
            + fault_create_debugfs_attr(xe_fault_inject_entry[i].name,
            root,
            <br>
            +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; xe_fault_inject_entry[i].attr);
            <br>
            +&nbsp;&nbsp;&nbsp; }
            <br>
            +}
            <br>
            +
            <br>
            &nbsp; static void read_residency_counter(struct xe_device *xe,
            struct xe_mmio *mmio,
            <br>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; u32 offset, const char *name, struct
            drm_printer *p)
            <br>
            &nbsp; {
            <br>
            @@ -563,8 +604,6 @@ void xe_debugfs_register(struct
            xe_device *xe)
            <br>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; drm_debugfs_create_files(debugfs_residencies,
            <br>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ARRAY_SIZE(debugfs_residencies),
            <br>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; root, minor);
            <br>
            -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fault_create_debugfs_attr(&quot;inject_csc_hw_error&quot;,
            root,
            <br>
            -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &amp;inject_csc_hw_error);
            <br>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }
            <br>
            &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; debugfs_create_file(&quot;forcewake_all&quot;, 0400, root, xe,
            <br>
            @@ -610,7 +649,7 @@ void xe_debugfs_register(struct
            xe_device *xe)
            <br>
            &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; xe_psmi_debugfs_register(xe);
            <br>
            &nbsp; -&nbsp;&nbsp;&nbsp; fault_create_debugfs_attr(&quot;fail_gt_reset&quot;, root,
            &amp;gt_reset_failure);
            <br>
            +&nbsp;&nbsp;&nbsp; xe_fault_inject_debugfs_register(xe, root);
            <br>
            &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (IS_SRIOV_PF(xe))
            <br>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; xe_sriov_pf_debugfs_register(xe, root);
            <br>
            diff --git a/drivers/gpu/drm/xe/xe_debugfs.h
            b/drivers/gpu/drm/xe/xe_debugfs.h
            <br>
            index 17f4c2f1b5e4..beedc7ebdaaa 100644
            <br>
            --- a/drivers/gpu/drm/xe/xe_debugfs.h
            <br>
            +++ b/drivers/gpu/drm/xe/xe_debugfs.h
            <br>
            @@ -6,8 +6,24 @@
            <br>
            &nbsp; #ifndef _XE_DEBUGFS_H_
            <br>
            &nbsp; #define _XE_DEBUGFS_H_
            <br>
            &nbsp; +#include &lt;linux/types.h&gt;
            <br>
            +
            <br>
            &nbsp; struct xe_device;
            <br>
            &nbsp; +/**
            <br>
            + * enum xe_fault_type - Fault injection types
            <br>
            + * @XE_FAULT_GT_RESET: GT reset failure injection
            <br>
            + * @XE_FAULT_CSC_HW_ERROR: CSC hardware error injection
            <br>
            + * @XE_FAULT_MAX: Number of fault injection types
            <br>
            + */
            <br>
            +enum xe_fault_type {
            <br>
            +&nbsp;&nbsp;&nbsp; XE_FAULT_GT_RESET,
            <br>
            +&nbsp;&nbsp;&nbsp; XE_FAULT_CSC_HW_ERROR,
            <br>
            +&nbsp;&nbsp;&nbsp; XE_FAULT_MAX
            <br>
            +};
            <br>
          </blockquote>
          <br>
          I would still prefer an abstracted function.
          <br>
          <br>
        </blockquote>
        Sure! We can define a named macro for each fault type, such as
        xe_fault_gt_reset() and xe_fault_csc_hw_error(),
        <br>
        <br>
        as thin wrappers around a common dispatcher like
        <br>
        <br>
        #define xe_fault_gt_reset() xe_fault_inject(XE_FAULT_GT_RESET)
        <br>
        <br>
        <br>
        Thanks,
        <br>
        <br>
        -/Mallesh
        <br>
        <br>
        <blockquote type="cite">
          <br>
          Thanks
          <br>
          Riana
          <br>
          <br>
          <blockquote type="cite">+
            <br>
            +bool xe_fault_inject(enum xe_fault_type type);
            <br>
            +
            <br>
            &nbsp; #ifdef CONFIG_DEBUG_FS
            <br>
            &nbsp; void xe_debugfs_register(struct xe_device *xe);
            <br>
            &nbsp; #else
            <br>
            diff --git a/drivers/gpu/drm/xe/xe_gt.c
            b/drivers/gpu/drm/xe/xe_gt.c
            <br>
            index 783eb6d631b5..eda8df8adf11 100644
            <br>
            --- a/drivers/gpu/drm/xe/xe_gt.c
            <br>
            +++ b/drivers/gpu/drm/xe/xe_gt.c
            <br>
            @@ -21,6 +21,7 @@
            <br>
            &nbsp; #include &quot;regs/xe_gt_regs.h&quot;
            <br>
            &nbsp; #include &quot;xe_assert.h&quot;
            <br>
            &nbsp; #include &quot;xe_bb.h&quot;
            <br>
            +#include &quot;xe_debugfs.h&quot;
            <br>
            &nbsp; #include &quot;xe_device.h&quot;
            <br>
            &nbsp; #include &quot;xe_eu_stall.h&quot;
            <br>
            &nbsp; #include &quot;xe_exec_queue.h&quot;
            <br>
            @@ -923,7 +924,7 @@ static void gt_reset_worker(struct
            work_struct *w)
            <br>
            &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; xe_gt_info(gt, &quot;reset started\n&quot;);
            <br>
            &nbsp; -&nbsp;&nbsp;&nbsp; if (xe_fault_inject_gt_reset()) {
            <br>
            +&nbsp;&nbsp;&nbsp; if (xe_fault_inject(XE_FAULT_GT_RESET)) {
            <br>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; err = -ECANCELED;
            <br>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; goto err_fail;
            <br>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }
            <br>
            @@ -980,7 +981,7 @@ void xe_gt_reset_async(struct xe_gt *gt)
            <br>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; xe_gt_info(gt, &quot;trying reset from %ps\n&quot;,
            __builtin_return_address(0));
            <br>
            &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Don't do a reset while one is already in flight
            */
            <br>
            -&nbsp;&nbsp;&nbsp; if (!xe_fault_inject_gt_reset() &amp;&amp;
            xe_uc_reset_prepare(&amp;gt-&gt;uc))
            <br>
            +&nbsp;&nbsp;&nbsp; if (!xe_fault_inject(XE_FAULT_GT_RESET) &amp;&amp;
            xe_uc_reset_prepare(&amp;gt-&gt;uc))
            <br>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return;
            <br>
            &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; xe_gt_info(gt, &quot;reset queued\n&quot;);
            <br>
            diff --git a/drivers/gpu/drm/xe/xe_gt.h
            b/drivers/gpu/drm/xe/xe_gt.h
            <br>
            index 4150aa594f05..f8e3ca63aabb 100644
            <br>
            --- a/drivers/gpu/drm/xe/xe_gt.h
            <br>
            +++ b/drivers/gpu/drm/xe/xe_gt.h
            <br>
            @@ -6,8 +6,6 @@
            <br>
            &nbsp; #ifndef _XE_GT_H_
            <br>
            &nbsp; #define _XE_GT_H_
            <br>
            &nbsp; -#include &lt;linux/fault-inject.h&gt;
            <br>
            -
            <br>
            &nbsp; #include &lt;drm/drm_util.h&gt;
            <br>
            &nbsp; &nbsp; #include &quot;xe_device.h&quot;
            <br>
            @@ -38,12 +36,6 @@
            <br>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; xe_gt_is_media_type(gt_) ? MEDIA_VER(xe) :
            GRAPHICS_VER(xe); \
            <br>
            &nbsp; })
            <br>
            &nbsp; -extern struct fault_attr gt_reset_failure;
            <br>
            -static inline bool xe_fault_inject_gt_reset(void)
            <br>
            -{
            <br>
            -&nbsp;&nbsp;&nbsp; return IS_ENABLED(CONFIG_DEBUG_FS) &amp;&amp;
            should_fail(&amp;gt_reset_failure, 1);
            <br>
            -}
            <br>
            -
            <br>
            &nbsp; struct xe_gt *xe_gt_alloc(struct xe_tile *tile);
            <br>
            &nbsp; int xe_gt_init_early(struct xe_gt *gt);
            <br>
            &nbsp; int xe_gt_init(struct xe_gt *gt);
            <br>
            diff --git a/drivers/gpu/drm/xe/xe_hw_error.c
            b/drivers/gpu/drm/xe/xe_hw_error.c
            <br>
            index 4b72959b2276..bdbf87eb743d 100644
            <br>
            --- a/drivers/gpu/drm/xe/xe_hw_error.c
            <br>
            +++ b/drivers/gpu/drm/xe/xe_hw_error.c
            <br>
            @@ -4,7 +4,6 @@
            <br>
            &nbsp;&nbsp; */
            <br>
            &nbsp; &nbsp; #include &lt;linux/bitmap.h&gt;
            <br>
            -#include &lt;linux/fault-inject.h&gt;
            <br>
            &nbsp; &nbsp; #include &quot;regs/xe_gsc_regs.h&quot;
            <br>
            &nbsp; #include &quot;regs/xe_hw_error_regs.h&quot;
            <br>
            @@ -12,6 +11,7 @@
            <br>
            &nbsp; &nbsp; #include &quot;xe_device.h&quot;
            <br>
            &nbsp; #include &quot;xe_drm_ras.h&quot;
            <br>
            +#include &quot;xe_debugfs.h&quot;
            <br>
            &nbsp; #include &quot;xe_hw_error.h&quot;
            <br>
            &nbsp; #include &quot;xe_mmio.h&quot;
            <br>
            &nbsp; #include &quot;xe_survivability_mode.h&quot;
            <br>
            @@ -25,8 +25,6 @@
            <br>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (PVC_COR_ERR_MASK &amp;
            REG_BIT(err_bit)) : \
            <br>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (PVC_FAT_ERR_MASK &amp;
            REG_BIT(err_bit)))
            <br>
            &nbsp; -extern struct fault_attr inject_csc_hw_error;
            <br>
            -
            <br>
            &nbsp; static const char * const error_severity[] =
            DRM_XE_RAS_ERROR_SEVERITY_NAMES;
            <br>
            &nbsp; &nbsp; static const char * const hec_uncorrected_fw_errors[] =
            {
            <br>
            @@ -167,11 +165,6 @@
            static_assert(ARRAY_SIZE(pvc_master_local_nonfatal_err_reg)
            == XE_RAS_REG_SIZE);
            <br>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pvc_master_local_fatal_err_reg :
            \
            <br>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            pvc_master_local_nonfatal_err_reg)
            <br>
            &nbsp; -static bool fault_inject_csc_hw_error(void)
            <br>
            -{
            <br>
            -&nbsp;&nbsp;&nbsp; return IS_ENABLED(CONFIG_DEBUG_FS) &amp;&amp;
            should_fail(&amp;inject_csc_hw_error, 1);
            <br>
            -}
            <br>
            -
            <br>
            &nbsp; static void csc_hw_error_work(struct work_struct *work)
            <br>
            &nbsp; {
            <br>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct xe_tile *tile = container_of(work,
            typeof(*tile), csc_hw_error_work);
            <br>
            @@ -507,7 +500,7 @@ void xe_hw_error_irq_handler(struct
            xe_tile *tile, const u32 master_ctl)
            <br>
            &nbsp; {
            <br>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; enum hardware_error hw_err;
            <br>
            &nbsp; -&nbsp;&nbsp;&nbsp; if (fault_inject_csc_hw_error())
            <br>
            +&nbsp;&nbsp;&nbsp; if (xe_fault_inject(XE_FAULT_CSC_HW_ERROR))
            <br>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; schedule_work(&amp;tile-&gt;csc_hw_error_work);
            <br>
            &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for (hw_err = 0; hw_err &lt; HARDWARE_ERROR_MAX;
            hw_err++) {
            <br>
          </blockquote>
        </blockquote>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------RFwTVIJYtDUXrywDIG6ca0N0--
