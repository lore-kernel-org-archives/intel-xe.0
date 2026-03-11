Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D96DB1062862
	for <intel-xe@archiver.kernel.org>; Wed, 11 Mar 2026 11:32:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A32C10E8A3;
	Wed, 11 Mar 2026 11:32:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QBrDdYv+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C3DE10E8A1
 for <intel-xe@lists.freedesktop.org>; Wed, 11 Mar 2026 11:32:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773228723; x=1804764723;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=GnJp3KzeqNRdDVXIrkNtcNeNFh2HMXPkkcutZjFD1LM=;
 b=QBrDdYv+1FfJy4twDhkgpmWHGjTsLbtvDNH5m/GFQ0vZGoZpTv+272sj
 BStX4HbXorO5spWXQgVtQCqztMbNnhTBLUGgWBAPAeiwHA1JdqItmzJUK
 0WbZoN5Oi4QQWsWED/p93+UxJ8xPslmqLXPB06QRD0i+mCb2XK/oOd9jn
 Fy9lnYfEghIIkNCdk099vJ/UPTlG4FVy6eenuPGhN/q/NNIT0QfEZr8Eu
 I1dYBPWDfWSrb1DMoNe3oKql9Q30JAwO21vqiYUKBLpkWC4bPVzyqHpEm
 MScRzZSFGcmV1VTm3ZvuFM8ZfC+Gzf/oyIj0BGq/iKK9FgySVvcgzcEej w==;
X-CSE-ConnectionGUID: PVkVAPntQEe210V0EDn+sw==
X-CSE-MsgGUID: QiCnSbIXQdGqWz/j6Hvhaw==
X-IronPort-AV: E=McAfee;i="6800,10657,11725"; a="99757695"
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; d="scan'208";a="99757695"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2026 04:32:02 -0700
X-CSE-ConnectionGUID: GXBKzobNSgyVU9iRZlfiFQ==
X-CSE-MsgGUID: rsru/wW0Q7CANIFGBLc6lQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; d="scan'208";a="225132291"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2026 04:32:02 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 11 Mar 2026 04:32:01 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 11 Mar 2026 04:32:01 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.60) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 11 Mar 2026 04:32:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P+KBaFjWS5dA2b+RCYngzqS81ZT5lbkzk9Wq9a0eXeQlwutMiLl/m7TKRuRG67q+aaw+bX6rn7jL0234b7UFSco5VGPbR6nSt3HQHQBsYAHKwUxAcerkS2qy+GxT9DzwnCHosheq2/7X+8TQgbPgc+M/ISLud1oPGUJ8TeQ8K31AvwmxpNwnYFtRauv3g/R8hCd5c8DBzac016T3dCzlJzReDklJiqMpXve0BkocKwdftFuqbyl7Q4dVssxew5+UQb1JUGlyN6RB8euFYuYf88rryvBO/mc5LAJJlc8Kw/0XH8SX3pMDz/NIvwKwjgFXkLwvsNVjAcDG7th2fq8LeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eVHRDli0/8IbExrTdWJO/ii6TGN0L2f0JNiiF8pnOgM=;
 b=XDyPnZphbeXwDhL3Qfg+IS19LdZIS7iRplOlN/K9w4XXN5OqB4id9yfeqAdqGmb73oMRDdkPYDWqwXUOf93WahT79X/MorDZ4VNYK1W8XCuoc+cqKGRUzwk11h9sfWqP2T4HjmJUVh5SCeALNvniOX8/dR16LbLaQYT6SyShVfrSR5anX1pftbkD9fRSr3rjGn5KN2F485Mine3c2pOKiPUGKb+h3fRf64NE2yvb7P0ODNobb7K2jfSx9rNYijGZKcy5Bdb4qL6zm8hH77/pWm0J9w0Ci5JaP9nYs6MKlLh+rMa9L48+7HitJb5boX+gRe6+WIO+rl1c49G3emRXig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 MN0PR11MB6010.namprd11.prod.outlook.com (2603:10b6:208:371::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.15; Wed, 11 Mar
 2026 11:31:58 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99%6]) with mapi id 15.20.9700.010; Wed, 11 Mar 2026
 11:31:58 +0000
Message-ID: <282f4211-12e5-4fe0-96dc-72f7b718cbe9@intel.com>
Date: Wed, 11 Mar 2026 17:01:49 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 6/6] drm/xe/pci: Enable System Controller for CRI
 platform
To: "Anoop, Vijay" <anoop.c.vijay@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <umesh.nerlige.ramappa@intel.com>, <badal.nilawar@intel.com>,
 <rodrigo.vivi@intel.com>, <aravind.iddamsetty@intel.com>,
 <anshuman.gupta@intel.com>, <matthew.d.roper@intel.com>,
 <michael.j.ruhl@intel.com>, <paul.e.luse@intel.com>,
 <mohamed.mansoor.v@intel.com>, <kam.nasim@intel.com>
References: <20260310182336.611041-8-anoop.c.vijay@intel.com>
 <20260310182336.611041-14-anoop.c.vijay@intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <20260310182336.611041-14-anoop.c.vijay@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0255.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1f1::8) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|MN0PR11MB6010:EE_
X-MS-Office365-Filtering-Correlation-Id: 49ab4178-e6b8-47d3-a080-08de7f61cde5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|56012099003|18002099003|22082099003; 
X-Microsoft-Antispam-Message-Info: bu2ZFWZ95PqmQQqSjWCwa9pqIFHNEmQXjmm/nbCyxsFRZB/fSrcARZmnAL2IN4LeH0e7kZobHxeTb+b+FJzxZGMomQhK78da2ijZRY+0jWuK6yDopS1zMCkZpH5RZ9hk64QCwwNu6gufJ1Xu0S1OXa1llPjKGeqfKY+GdMdnXb4OfCB1VfYc6g0Gk8OOcBuJVQr/mn7UWB76t+m4FW0NkSfYBeAi5mPZDkaCtW2hFggPNiUe7IBdAQ09dxjxeAbmctVRTvpnU7sYjvLFjxanPPyUYozhipXzzCUfUrgvvVNAjHrd65glh+Rfnbnwjhtd21DIOMfMnScPdHRRpSHjsMplPI+3Bk7BUGOWSwqivLW76cnYzMKAV1CsDQrifPo7kp7v/a5dCgoFPiOi/wpLxGs7nP2wPViqHA71XkLckgz2+AwEm46MIIsi4pFa/iBdWfjxmvmW+Km0zjQ4O34LLt2nSF+o0mxvfevIwCN7ZFhr7McCIYkxLajSk4+NfLkFvhJ8fUO4LHgW6o/Ml4+xc8+tQz3r2LozxjPXr8nOCF/N8ZESB/z/ksp3G/GoiYjDBY3ny+YKEFKN62uei1KkJ3O5WZUtZNAwBTOheJRCGo5r0Y9gdEiPkJto/wM1IytlknJmooaxsWcMTd7XCNAACbNtPKq5UnGj3m9Pj+fECvVLjrgRn6DIwfIN4q5cxLWoKmpKa23GPIY3EemDI2ag1+5hCQMJXkSs6Zuk070QtIs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(56012099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UTVIUGRrQy9YTVZ4VzFwU2FyWS8vdUwyT0JrTDlISkt5NVozVW9kZHVPRkpw?=
 =?utf-8?B?dnVjeVBQcGY4bG02bXR1a1M5RVZpWndwdUw5a1VKZUNQamVDeXpOc3ltOXp0?=
 =?utf-8?B?a1hZZ2FUUzFWekhGU1JDeTUwcEhXWmJ4V0xVdXpTNUJtMUhBdmxRUzIyZ0h2?=
 =?utf-8?B?THJzamNibzV1UlQzMVVBTnZWSWJjTWR3bzA5SmxkQ2s2YnhVUUE4YVdHTWpy?=
 =?utf-8?B?OFNxSElWMmQvL3dzVjlEWVgzcWtGdFhDOUlvY3FLaXdVdjFxVHN5Y3hBWUhR?=
 =?utf-8?B?RU5CS04vNGErVGJnb1FlbGxXbEwwT0JnaTBlb0RuL0xURDlHeSs3SFhKeCto?=
 =?utf-8?B?RFQvNTV6azIzMnVFY2dMcDFoSFdxMWkyaEZXVjJBcXplMWN1UWZNVzNlRzB1?=
 =?utf-8?B?Q1JHTy90YmZuYmxCVmExT1ZsZk45Mmd1Y1dsV0ZtN3pXNURVV2krNE1hWldS?=
 =?utf-8?B?a1ZJSE1nRi9Wc005YTVEWDlYeG1qQXFITlVLQnhrTFBhbkFwc1M0M2dyOW92?=
 =?utf-8?B?Nk1ic3F1WFNVakZnQUkyamxUai85MlJ1am9wUUNTV0hOaVMzUkptSldKY3VC?=
 =?utf-8?B?TnJLaDd5L2JjZk8vY2RZWlVFRGhqajZaVCtxbVM2Q21iOUkwU1hNZ05PWlFp?=
 =?utf-8?B?UmZ5VEV4Q294WUd3S24rQjJUVHlDdzd6UnIrekpOaEtIeTlQbURpY0pQc2w5?=
 =?utf-8?B?TTVSZVgvK3RCUDhyeGRoV05TbG9zT3B2bTQ0aFUwelNXV09Wc2N5bFFGRUZD?=
 =?utf-8?B?bXlUTVg5Ty92VlZldW5wWE9RNEh5MVR4REdHanRWZjdBMVRwSnZyNkxuRCtJ?=
 =?utf-8?B?RkVaUjl3Z2FkZnRMbWJNbFdoMmxxSTFxd2Z4ZUwrYkk2RmEyOCsxZGhTYlFV?=
 =?utf-8?B?UmpFTkE0a2t2SnljN3ZlT3E3b0xwKzNsT2l5bkNZU1Y0VlpmUXg1NkZraUhO?=
 =?utf-8?B?cG9JT0c4S3hFR3N5c3ljV0FVRmZCckVDUjlLeTlyWTJEaG90cTdIaDhsNkdM?=
 =?utf-8?B?ZHZ3dWNwanVRb2l5ZEhWSkVUMFNmRmVvMGIxb2VlRGcwaDhqaTArSFNySVBv?=
 =?utf-8?B?MXpKVUp4Y1NVMXZjMXRhN1NlN1ZvQW5iQ29zMU9zQmJ4YklodWNmUzBzK2cx?=
 =?utf-8?B?ZWcybE90bnNPakY1cW54eFJrZkhIQUhTL2NweDZFRFRaUjJ0UEhsWEdYOUhk?=
 =?utf-8?B?RElHWFJ6UjkzNkZzb1B6NXdpRDNlZ2NGekxtSUR5c0o0L25kMkY5a1Fya3Zt?=
 =?utf-8?B?THBneU8yWkM2blpRdVNrUEduWldGNmd4QkVKb3d4SVlxb3VZT0NBUGxzUmJt?=
 =?utf-8?B?S3lub1dmUXlnb3Y3WS9IVTB3VlpEd0dOS09mdS9pZEtNVjhTT3V1YU5wU0Fn?=
 =?utf-8?B?OTBtZlRjTFR6THZFc3dRVGZPdlFFNWg2MUk2Q1BZM1hWY3hNN2kxREhzVWxl?=
 =?utf-8?B?WjRBRVJubTVtaHdjV3JtVmVHOWtyb0RsUVFtdUUrSHVKcjQ2M0NEL2RqSTRw?=
 =?utf-8?B?TzNnRkJ5di9pa3J1N1p6ZHphZm1sc0ZoSG1XclJDMWZ6bmdCVVBDM0t3d0RR?=
 =?utf-8?B?ekFLYWY5Ni9wVmtHeDJEdlFiZEl4QjlFZkR5WDRSUWhGNHZpNkJ3RnRVOTBY?=
 =?utf-8?B?eGJSM1JmVi9CanZDZzZ3c296L1VXR21lU1M5Q1I2bVpET2RITzdOaG9PUGk0?=
 =?utf-8?B?L2MrUzE2d0dBUnhyc2RSaG1nUHJYSjdRQndJdzI3NW5Ca1VHTjJTL1ozRlVl?=
 =?utf-8?B?NXp2WDV4WWlHQ0VJcEdNU0RVS2VNNzVVZ1RXRnc0eUlMSkE3SEtleG1LNDh5?=
 =?utf-8?B?NG8yejltNTd1MENvM0RTRThxb0xUNXcrSzBtU2NKditvSzNYYW5FdXZETlM1?=
 =?utf-8?B?NXZEd1RYbWJiWFllb0dUamlYbFFzbHI3MFpyeWF6UkVSWm5FYnVGMWdHNnVS?=
 =?utf-8?B?WktSWXNDYU96TjZVc1M5ZU0reTRjVkw4ZklteVA1MGtVdkpkL0xOUU43M1dZ?=
 =?utf-8?B?V2V4NkFkL1NHK0U0RzdNcE5jWG41QW5Dd2Z6cElqSitEVlFkZEl2UlVvWnRB?=
 =?utf-8?B?QWFJQk9oRmZxVVl3MzhhOWE3NUh5SlJBQnhVZExjdCt0ZDQvY3duVTBuZVo4?=
 =?utf-8?B?UjIrSFg2ZGRmZzZDZlFKbUJ5QmdnNTg0UHFmbVZkTHBtSG1TWTJKRWFDb0w0?=
 =?utf-8?B?eUVWclZGc1lzaDNWajQ2MjhKSytVWjduWjBTenlqNjZOUXFwS1UyRkFjaWRo?=
 =?utf-8?B?aE95VjdtcVN6NFZwdWNiR05DQ3NPZFdOdWRJR1VXcUdXdjB5dmJ6VU9nM1h1?=
 =?utf-8?B?cExPSDdBZU41OGdybG1pcDgvOW5VaGlHaWpnUS8rSFJqT2tFR2FQdz09?=
X-Exchange-RoutingPolicyChecked: OXkzscFanP9WxCphlPbVg4gQ36XQ6yWoz+zCsEdlpl33aY1SMufqL+6SIAUJK0RR57ypbLIKpBBqFPwPaDYj66Gnjaq5f0mgr9aZtZloG3vhKhgenITPfOThUWFdO2EpJlIWsEcQBoujeEDEMFjrgfwYcBNjpn0U/GDKijbqzcXH3hjV4u9IpOrEORhUIjTIsHPSsi8WWsogeM7a4bdBQZmPoGyqtehW/EgHeKkv8h1PK0/Phon6ctFcXDFWgv2YljfacfSa8ZfXeYQmsF/V8qCtA2tpinC0hupy6+W7FGVBOS6gs4dWjqKO7f6BiaDI9vieZn9f1T8o45zGmalUjA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 49ab4178-e6b8-47d3-a080-08de7f61cde5
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2026 11:31:58.0246 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h5+yKyx2CQDUbno96bBdhQdinvFGb/g05gyOeBjgPusD7b/aZ4Iob+mOOaAnOm37dS9hB+8TQZwgVZPvfpf4yQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6010
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

Hi Anoop

Title should be

  drm/xe/xe_pci: Enable System Controller for CRI platform

Thanks
Riana

On 3/10/2026 11:53 PM, Anoop, Vijay wrote:
> From: Anoop Vijay <anoop.c.vijay@intel.com>
> 
> Enable System Controller support for CRI platform by setting
> has_sysctrl flag in device descriptor and runtime device info.
> 
> This allows the System Controller subsystem and mailbox communication
> to be initialized on CRI platform.
> 
> Signed-off-by: Anoop Vijay <anoop.c.vijay@intel.com>
> ---
> v8: (Matt, Michal)
> - Reordered patches for logical flow
> ---
>   drivers/gpu/drm/xe/xe_pci.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index 29f976e66848..3d4a6619315f 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -465,6 +465,7 @@ static const struct xe_device_desc cri_desc = {
>   	.has_soc_remapper_sysctrl = true,
>   	.has_soc_remapper_telem = true,
>   	.has_sriov = true,
> +	.has_sysctrl = true,
>   	.max_gt_per_tile = 2,
>   	MULTI_LRC_MASK,
>   	.require_force_probe = true,
> @@ -764,6 +765,7 @@ static int xe_info_init_early(struct xe_device *xe,
>   	xe->info.has_soc_remapper_telem = desc->has_soc_remapper_telem;
>   	xe->info.has_sriov = xe_configfs_primary_gt_allowed(to_pci_dev(xe->drm.dev)) &&
>   		desc->has_sriov;
> +	xe->info.has_sysctrl = desc->has_sysctrl;
>   	xe->info.skip_guc_pc = desc->skip_guc_pc;
>   	xe->info.skip_mtcfg = desc->skip_mtcfg;
>   	xe->info.skip_pcode = desc->skip_pcode;

