Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0C60CA9ED1
	for <intel-xe@archiver.kernel.org>; Mon, 12 Oct 2026 05:16:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 643CE10E454;
	Mon, 12 Oct 2026 05:16:10 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8E7210E454
 for <intel-xe@lists.freedesktop.org>; Mon, 12 Oct 2026 05:16:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791782164; x=1823318164;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ojixyiHVtNUqopLTgnx2FhgIL+pQnlb0ySrJcsiRBHs=;
 b=VCslTUMJaTIIfVV1P626cdyt/YTyMwgMrTJXLqD0yZJlnLw0f/iPrBJO
 ZTwrvszop5/z98CsHmcvKc/KUDuSnySqMij8EMP+z7OQBXUFg+1yPJE/K
 m/gJFxC3LWx2B9uO/tMD31KHzbfbHqtN0SgUAqJj2GGLOu++7VoSdpy+C
 3jdas/A9tfLnUE6VT2wbgXwEiT+bitGkLa6GrSlcbUPvHgTRCpIi0iTkU
 vlEqaBvyJ5JZNTQQOz00xiE3C37sz6vSudMGmKrgfdSrUgfjYsbfffaq9
 BpzAjI/6XzPQB0x4g/BbA6XMYD8/zz9KYNuGsHWQhfywg1Ldmw8v2SjJA Q==;
X-CSE-ConnectionGUID: k1+dJQ5RTL+xUSVoLgD9Wg==
X-CSE-MsgGUID: q2rerOwcQSqtBdYE11tCHQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11932"; a="384065"
X-IronPort-AV: E=Sophos;i="6.27,153,1787036400"; 
   d="scan'208";a="384065"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2026 22:16:02 -0700
X-CSE-ConnectionGUID: mrS1J4DhQ9O4NTvAdd1jsA==
X-CSE-MsgGUID: U0L54Lo7QoOv4MxJbOmZyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,153,1787036400"; 
   d="scan'208";a="815564"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2026 22:16:02 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Sun, 11 Oct 2026 22:16:01 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Sun, 11 Oct 2026 22:16:01 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.67) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Sun, 11 Oct 2026 22:16:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CyNvADRkZicEp02SEcIFhl9Ur2xcfLCsdse0TEW96dWpWaVtbDBESJxj8W8nrKqJN8n0+Rbdu0JgTb3balu7Lg2c9EwYPQAPDmHM1ot/+QiL1q0OFstvBYrPhb7QELxjLxhevWygbDs3rZEtVbYIyfRv3rK6YwEFIRLmprHLi7ieTkx0nC4hUuJYbpFr5AZVuaF1DyAA/jSaImU8pRPnV98GAw17JSErFM+sBmA/YHBojjrZ+xm8jm99FHqK0bOR/NHjeJd2JEfHVYJdY1hM5qZFf771PgryXDD6DPQamAUc2+RSv4K8F6Ne9Tek1dcUK/1rtSMH6CCbL7kbmI4BXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uQ8rHkU838uFrYGCdvle4yLeZgE7UBPu3gjCTNMtju8=;
 b=ATzEW95F3Vl73EnCjKMqTOHIMvEmx6PE7ztU7jORTA/PurC2OGcGo3/DMz12xmLKYmLYowATl/TvRlnKdAEDILZSdyrYotPzoZRSw5vnB0pfY7PdMRneoUi82Lpha9BkCaI9dws37fQas0Ne34oBLaz2KMWCky/bZcn90T9baNVyL+pFNjL0fNDJI8sxedf5xYriW8M++PWJgxjQQ+K1V9C4AkljM6a+fikCFpzZ+I98YvmjVNoy1GhCQuBqoayOIfdf/q0NKXIW4bEoUMnfVS6LQ4qgNz6Bwya3yiRQpMAMLWAAHbReN3VIGaTdhSaMx6GeCgz10blQtvaC4eXKZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 SJ0PR11MB5940.namprd11.prod.outlook.com (2603:10b6:a03:42f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.21; Mon, 12 Oct
 2026 05:15:57 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99%5]) with mapi id 15.21.0472.016; Mon, 12 Oct 2026
 05:15:56 +0000
Message-ID: <4c09f119-75da-41c5-ab61-408b7baf0859@intel.com>
Date: Mon, 12 Oct 2026 10:45:49 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/xe: Add wa_14028434957 to Graphics Version 35.11
To: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>, "Gupta, Varun"
 <varun.gupta@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
CC: "Roper, Matthew D" <matthew.d.roper@intel.com>, "Vivi, Rodrigo"
 <rodrigo.vivi@intel.com>
References: <20261009075224.1316885-2-varun.gupta@intel.com>
 <DS0PR11MB871877C3D61FED9F74533E83819F2@DS0PR11MB8718.namprd11.prod.outlook.com>
Content-Language: en-US
From: "Tauro, Riana" <riana.tauro@intel.com>
In-Reply-To: <DS0PR11MB871877C3D61FED9F74533E83819F2@DS0PR11MB8718.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0254.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:223::19) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|SJ0PR11MB5940:EE_
X-MS-Office365-Filtering-Correlation-Id: 2959c9d1-fbd9-4802-a526-08df281fe4eb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|23010399003|11063799006|56012099006|4143699003|260925021911599003|260925021311599003|260925022911599003|261009223027099003|10067099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info: OhzxKsVmrN9ozRYYLjbQtJf9mGl6v2bvlgQ0Tm9ogZCVhTAWEiuLq+r2KH62HLfMuULAwCRl3RECeGO3dVk8PPi26vEfKyJCQqLWkuGZa+DIUTUZpo3db31Uax6U9GFYi2dn+PgyxyNj5k6/NyfWNJe4a3/yULT5GJKETQzZ8PAm4ZVg6gQ6P6En5ZYBqrrcOt2xQyi88jcX8+OmF1u2orXXXHAVIlnhHKgMNf8EJjkUA730AyVuiZG2cnF2+owIg+K7Iyk6DvBEyi7LTzbkim7rfBMtis+8uEL89Hghzch5vhRybpDKzRzsd1lNmJFh6VDJTk+HYZAogtlgs7Ixz/t7fAYU+6em2qvBJnOfkPTfArEFavpobhkxc9Vb7LpLljN91gSUpknOUAOsLtyA7vFS3wDazSfEYuaZq6d5ixqtTgRqvfzCsEqAzzyNTR3dKY4vwRvDwHLT4+r5GqxCdk5xv5JT5k125tYpVJDfIJ4Z+eoDcSr8NO3uqXih49qn9Wi42MKxE1ECvYaGXJtXvB0Fld+rzQ4s9spQuhQeG2oZqcde+LXxJT8fs19Fr1XnCCbfijehVBS8r0x1wy0zaQRoDzFIJE+HPp7h1UDTtKxWCeQa4mgHnc84ZdZLQcAX
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(11063799006)(56012099006)(4143699003)(260925021911599003)(260925021311599003)(260925022911599003)(261009223027099003)(10067099003)(22082099003)(18002099003)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QjBqbUhoZUNwaFFoQ2pMM1F5R3VvRnBIdDZiWTZqUmRHalJRTWRoY0hQZStw?=
 =?utf-8?B?dm1GTHJ3QWd1bUVpdHFHTXBNMnhFbk4wZHJrczhPQlBkbHNVSVEydUNlNk1H?=
 =?utf-8?B?QURhRFptM1hoVkx4L2FRaENmQUFaaUFUUUhmYkMwWE1kQTNMK05xZ1JUNXpt?=
 =?utf-8?B?a2NkZ0doSC9Fbm1haWJiNVJVSTZ6b3lQM2hlREUxbDJZT29DM3BZZTg2UFpU?=
 =?utf-8?B?dng2UlAyZkw0MHkxakNDNERHd3lOWHRRQktOVlpXbVQ1U3NzN0FrbERCTGs3?=
 =?utf-8?B?R21FTWR2NVdHaldCUUZhSTE0akZ4NHhxZzBiTFVCZzZXNXVMR0xDanZnajhP?=
 =?utf-8?B?WGhuR3FpY0gxMWNia3NMdlZ2RzMzUjhzUGNPVTVnTDEvMUpFMHV3K3lNTHJI?=
 =?utf-8?B?OGM5K2lRN2NxT1ArNlRhY2wrVlg0TklCcHVvYWxQRzFyQ0NsZ0pQNGthQnBa?=
 =?utf-8?B?RGpTaFNMd0R3ZXc1SlV4eGFZY2VaVjJJd1U2SkxJYlI2eXJ4Sjhld210N2FF?=
 =?utf-8?B?cFFpZDBuSmFpUDQwZFE3MFpvUDdSQ1BwaUdTTDY1QmtkR2FMdStPelhVbDBi?=
 =?utf-8?B?YWg5VjZUMElzQWhvUVZtQ3R6UUxTM1lGQVFmbFh6U0NKa2hOWklkNzhVNm54?=
 =?utf-8?B?ZXQ5L3NQQ3IvcUhZNjVBYVpEckpzOWFsYzBESnNLS0RJZ3pKanNKV3dvdkpn?=
 =?utf-8?B?MFk5TEExTnpIRnczekJOeFNTbWNuSFJpUU0wMlFzcUFSd2o3RjY0cW9UMVMr?=
 =?utf-8?B?T2IxSWNrNFB6ZmpsNW9xTncvSmg2ZStmMzBjVi93bllJUFNBSVY4L3JmTUN6?=
 =?utf-8?B?bnpyVzM4YmhGNTJOYkwxVGpPYVpTak1JV3ByaHk2OW9ISG9HNVFqUHdaa2lm?=
 =?utf-8?B?VVVVakl6WStkZ3VaNnhoaHlyeldOM1RIVElOd0tBLytmTURvODF4MGp3eWp3?=
 =?utf-8?B?ZXZOaVJmR3hkQ1BnNVIramV0a2I3a1lIRmxWMHBwbVdqQUJQVXdsT2dvVjFC?=
 =?utf-8?B?Z3JETG9HMWdmM1kvMDdubTBzT2lNZTUybEFEREE4WDcvRE95cnliSjJwOWV1?=
 =?utf-8?B?eU5wd08rYkhXb0xyLzFJZjkvaXZsMzVPQm9EUlM5YkFTSTZ6dFduYndZMGt2?=
 =?utf-8?B?eGNsdU0raXlZRTVLSEZHQk9EYitTdFV2UDlTTHNnSjZBTDdyTXRwd25hRjlL?=
 =?utf-8?B?RVdtbEE2ejJKdWxIWU5YdzFGUmpqMzJNYlNhOVBybDkxOFMreUJLTlFiWDk4?=
 =?utf-8?B?NzNsMy82ZCtSRFQ3Vm5zN0VIWkMxbnQ3RnJ5Nm9MTXF5Sm50R1N6MnRDVDJt?=
 =?utf-8?B?TVRIay9oU0U0UkxXWURHK1FpZEZ5clF0VnFENVBNSmlPeUEydTlhRElvSUxT?=
 =?utf-8?B?ZUp1QXc0N0haSG10TDR3VUpjbkNJQWdybEJZUlJybWFtY0Zwelo1YnAreXdn?=
 =?utf-8?B?ZGk2UGczenlDWFhTNnRRNVlIOG5WMzJJa3VXd0N1RC9YOTM0UGR0N3RkYWU1?=
 =?utf-8?B?bCtqNVFvZ2s3R2ttWXR3VmFZMUo1SWRzbFNHOEg3bDFZWFVlTkNWOUZsOTEw?=
 =?utf-8?B?R0g3TUhHWEJ2bzNPZlpQWHVGT2FMSzlOUHEzV2FMZXY1K28zM2pydFZTTlpi?=
 =?utf-8?B?RXh4bUk3dTV4MmdlL2RNSlM4blpyWXNkNEF3RDN2d2dCcDh1VE5ab0Q5MjRw?=
 =?utf-8?B?cG50ckpkRVg4TThzMHZEb0JRZFQ1eHJFdGdhRFlTTjV2Tm8vc3Nwb25WeGg5?=
 =?utf-8?B?ODdPVEl2WThoS2NlOHlsZ3VPOTcxdDZRbVFTUy9OaEowcERKcmVlRzNOVTlj?=
 =?utf-8?B?dVNHOGpHazZKZW4vN1IySmZuQlVTcWVFS3BEdy8zZGZjRmxvYlBMUE5tUWRE?=
 =?utf-8?B?WVNHN0E3T1VlYjdZMHhUaFR3LzNacFRQRlh1WDNzbmtDSUJTVENiMlZMaVI2?=
 =?utf-8?B?WXZoalhySVNyRDIya3FQK0JEZUVpOFhvT21hY1ZoV0s1ajVjcVNLZTBRVFc1?=
 =?utf-8?B?dE1zaVQ3UEF4SFBHTlJqMXJvamJZeE5GN0Eyc3QwYS9NRmMvT2Z1czBVTTU0?=
 =?utf-8?B?MTNxT0cyM0tQQWpSS0ZPYmtmS1VCb1lBazR5T3lNTVpKQjl0aGNEdldhZis3?=
 =?utf-8?B?ejJYVW5zUFpSbUx1VnJoTGRCU1VSNDBKT2d0b1pnYUFHckZmOHlXcktmc0JF?=
 =?utf-8?B?WHpFUVJIWk9WOG1wcHpqVVVjNkRtR0NxSDR1SjlWVE9rS2xrUDQ4dzJJcUhY?=
 =?utf-8?B?cy9aWGlrRXplbTRSZjhmRklsY1JtS2EyZUpTeGFoeTVGODg5cFYyTTk1N3Z3?=
 =?utf-8?B?bEh3ZFBMRFFZd0R5WjY4ZERzb0lFV1loRGlOM0lOMndFVlRaZlNidz09?=
X-Exchange-RoutingPolicyChecked: Q6UgqqR1tJecsLZPwVo7PNZC/37Kz3nt3M2kadKQp80vxn/CX+ALa3g+KqSHrjUIs1HooGr/jJ4t4MlBbpE2vl6ikGK3GyISHYCpL7hADo3ei6RoTm89ED6KJ+QsVfDtCoevbL7+JmXcO4BS7XOeM1vFOO/ahxeHiYcu/kFi4Pzf6/IzGjJxZKUhwe7/k2gNQB39iT8V0he+EY42Buqsm6jpum0tQJclX6stIfAXh0qonxpy5Y78a/WO2Gp1sjglcubaZGlJCrAH/auk+QLyWE54F326qUMRZtWvHqELYyqPNjhFlKUZd8YCCDDDZU8n7d1yXdVtY9LLhO452xI70Q==
X-MS-Exchange-CrossTenant-Network-Message-Id: 2959c9d1-fbd9-4802-a526-08df281fe4eb
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2026 05:15:56.6245 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aMR9ZjVmR0kdV36g8Xt43+O/pCFpb0twN7nSOifDWX9EU88upnB3rbZBGjNlmWKn0d/dA0b79CrE1n/eSNsTgw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5940
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


On 12-10-2026 10:42, Upadhyay, Tejas wrote:
>
>> -----Original Message-----
>> From: Gupta, Varun <varun.gupta@intel.com>
>> Sent: 09 October 2026 13:22
>> To: intel-xe@lists.freedesktop.org
>> Cc: Roper, Matthew D <matthew.d.roper@intel.com>; Upadhyay, Tejas
>> <tejas.upadhyay@intel.com>; Vivi, Rodrigo <rodrigo.vivi@intel.com>
>> Subject: [PATCH v2] drm/xe: Add wa_14028434957 to Graphics Version
>> 35.11

This is already sent long back

Intel Xe - Patchwork

<https://patchwork.freedesktop.org/series/173001/>Why are we refloating 
this ?

Thanks
Riana

>>
>> Prevent the SNIB AER latch from swallowing back-to-back uncorrectable non-
>> fatal errors.
>>
>> Firmware bypasses the faulty AER path by routing these errors directly via
>> MSI. This patch intercepts the MSI and reuses the existing GFSP error
>> containment logic.
>>
>> Because GFSP mailbox queries can sleep, handling is deferred to a workqueue
>> (nonfatal_msi_work) to ensure hardirq safety. If a reset is required, the device
>> is wedged (a stopgap until VR driver quiescing support allows for an actual
>> Secondary Bus Reset).
>>
>> v2:
>>   - Return 'int' from xe_hw_error_init() to propagate failures.(Sashiko)
>>   - Use devm_add_action_or_reset() for teardown to prevent MMIO faults
>>     during PCI unbind.(Sashiko)
>>   - Add xe_pm_runtime guard in the worker thread.(Sashiko)
>>
>> Assisted-by: LLM
>> Signed-off-by: Varun Gupta <varun.gupta@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_device_wa_oob.rules |  2 +
>>   drivers/gpu/drm/xe/xe_drm_ras_types.h     |  5 +++
>>   drivers/gpu/drm/xe/xe_hw_error.c          | 52 ++++++++++++++++++++++-
>>   drivers/gpu/drm/xe/xe_hw_error.h          |  2 +-
>>   drivers/gpu/drm/xe/xe_irq.c               |  4 +-
>>   5 files changed, 61 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_device_wa_oob.rules
>> b/drivers/gpu/drm/xe/xe_device_wa_oob.rules
>> index d8dc41851425..29a7d96a5666 100644
>> --- a/drivers/gpu/drm/xe/xe_device_wa_oob.rules
>> +++ b/drivers/gpu/drm/xe/xe_device_wa_oob.rules
>> @@ -7,3 +7,5 @@
>>   14026633728	PLATFORM(CRESCENTISLAND)
>>   14026746987	PLATFORM(CRESCENTISLAND)
>>   14026779378	PLATFORM(CRESCENTISLAND)
>> +14028434957	PLATFORM(CRESCENTISLAND)
>> +
>> diff --git a/drivers/gpu/drm/xe/xe_drm_ras_types.h
>> b/drivers/gpu/drm/xe/xe_drm_ras_types.h
>> index 0be218ba2db7..7a35390a9ffd 100644
>> --- a/drivers/gpu/drm/xe/xe_drm_ras_types.h
>> +++ b/drivers/gpu/drm/xe/xe_drm_ras_types.h
>> @@ -9,6 +9,8 @@
>>   #include <linux/atomic.h>
>>   #include <drm/xe_drm.h>
>>
>> +#include <linux/workqueue.h>
>> +
>>   struct drm_ras_node;
>>
>>   /* Error categories reported by hardware */ @@ -46,6 +48,9 @@ struct
>> xe_drm_ras {
>>
>>   	/** @disable_vram_page_offline: cached configfs policy, immutable
>> after init */
>>   	bool disable_vram_page_offline;
>> +
>> +	/** @nonfatal_msi_work: Worker to process uncorrectable non-fatal
>> errors */
>> +	struct work_struct nonfatal_msi_work;
>>   };
>>
>>   #endif
>> diff --git a/drivers/gpu/drm/xe/xe_hw_error.c
>> b/drivers/gpu/drm/xe/xe_hw_error.c
>> index 5f2abc9485ff..bde707a3fb64 100644
>> --- a/drivers/gpu/drm/xe/xe_hw_error.c
>> +++ b/drivers/gpu/drm/xe/xe_hw_error.c
>> @@ -5,6 +5,8 @@
>>
>>   #include <linux/bitmap.h>
>>
>> +#include <generated/xe_device_wa_oob.h>
>> +
>>   #include "regs/xe_gsc_regs.h"
>>   #include "regs/xe_hw_error_regs.h"
>>   #include "regs/xe_irq_regs.h"
>> @@ -14,7 +16,10 @@
>>   #include "xe_drm_ras.h"
>>   #include "xe_hw_error.h"
>>   #include "xe_mmio.h"
>> +#include "xe_pm.h"
>> +#include "xe_ras.h"
>>   #include "xe_survivability_mode.h"
>> +#include "xe_wa.h"
>>
>>   #define GT_HW_ERROR_MAX_ERR_BITS		16
>>   #define HEC_UNCORR_FW_ERR_BITS			4
>> @@ -173,6 +178,29 @@ static void csc_hw_error_work(struct work_struct
>> *work)
>>   	xe_survivability_mode_runtime_enable(xe);
>>   }
>>
>> +static void nonfatal_msi_work(struct work_struct *work) {
>> +	struct xe_drm_ras *ras = container_of(work, typeof(*ras),
>> nonfatal_msi_work);
>> +	struct xe_device *xe = container_of(ras, typeof(*xe), ras);
>> +
>> +	guard(xe_pm_runtime)(xe);
>> +	enum xe_ras_recovery_action action = xe_ras_process_errors(xe);
>> +
>> +	/*
>> +	 * TODO: Request an SBR instead of wedging, once VR driver
>> +	 * quiescing support is in place.
>> +	 */
>> +	if (action != XE_RAS_RECOVERY_ACTION_RECOVERED)
>> +		xe_device_declare_wedged(xe);
>> +}
>> +
>> +static void hw_error_fini(void *arg)
>> +{
>> +	struct xe_device *xe = arg;
>> +
>> +	cancel_work_sync(&xe->ras.nonfatal_msi_work);
>> +}
>> +
>>   static void csc_hw_error_handler(struct xe_tile *tile, const enum
>> hardware_error hw_err)  {
>>   	const enum drm_xe_ras_error_severity severity =
>> hw_err_to_severity(hw_err); @@ -436,6 +464,15 @@ static void
>> hw_error_source_handler(struct xe_tile *tile, const enum hardware_er
>>   	 * here for those platforms.
>>   	 */
>>   	if (xe->info.has_sysctrl) {
>> +		/*
>> +		 * Defer non-fatal MSI handling to process context because the
>> GFSP
>> +		 * query can sleep.
>> +		 */
>> +		if (hw_err == HARDWARE_ERROR_NONFATAL &&
>> XE_DEVICE_WA(xe, 14028434957)) {
>> +			schedule_work(&xe->ras.nonfatal_msi_work);
>> +			return;
>> +		}
>> +
>>   		drm_err_ratelimited(&xe->drm, HW_ERR "Invalid error
>> routing\n");
>>   		return;
>>   	}
>> @@ -541,15 +578,26 @@ static void process_hw_errors(struct xe_device
>> *xe)
>>    *
>>    * Initialize and check for errors that occurred during boot
>>    * prior to driver load
>> + *
>> + * Return: 0 on success, negative error code on failure.
>>    */
>> -void xe_hw_error_init(struct xe_device *xe)
>> +int xe_hw_error_init(struct xe_device *xe)
>>   {
>>   	struct xe_tile *tile = xe_device_get_root_tile(xe);
>> +	int err;
>> +
>> +	INIT_WORK(&xe->ras.nonfatal_msi_work, nonfatal_msi_work);
>> +
>> +	err = devm_add_action_or_reset(xe->drm.dev, hw_error_fini, xe);
>> +	if (err)
>> +		return err;
>>
>>   	if (!IS_DGFX(xe) || IS_SRIOV_VF(xe))
>> -		return;
>> +		return 0;
> Should this not be first check in this init? Everything that follows.  With that addressed, LGTM,
> Reviewed-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
>
> @Tauro, Riana do you see any concerns? I think for now it is planned to handle this way!
>
> Tejas
>>   	INIT_WORK(&tile->csc_hw_error_work, csc_hw_error_work);
>>
>>   	process_hw_errors(xe);
>> +
>> +	return 0;
>>   }
>> diff --git a/drivers/gpu/drm/xe/xe_hw_error.h
>> b/drivers/gpu/drm/xe/xe_hw_error.h
>> index 5e3a11424108..a9af4c947d77 100644
>> --- a/drivers/gpu/drm/xe/xe_hw_error.h
>> +++ b/drivers/gpu/drm/xe/xe_hw_error.h
>> @@ -11,5 +11,5 @@ struct xe_tile;
>>   struct xe_device;
>>
>>   void xe_hw_error_irq_handler(struct xe_tile *tile, const u32 master_ctl); -void
>> xe_hw_error_init(struct xe_device *xe);
>> +int xe_hw_error_init(struct xe_device *xe);
>>   #endif
>> diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c index
>> 9e49e2241da4..5ea50d203db1 100644
>> --- a/drivers/gpu/drm/xe/xe_irq.c
>> +++ b/drivers/gpu/drm/xe/xe_irq.c
>> @@ -811,7 +811,9 @@ int xe_irq_install(struct xe_device *xe)
>>   	int nvec = 1;
>>   	int err;
>>
>> -	xe_hw_error_init(xe);
>> +	err = xe_hw_error_init(xe);
>> +	if (err)
>> +		return err;
>>
>>   	xe_irq_reset(xe);
>>
>> --
>> 2.43.0
