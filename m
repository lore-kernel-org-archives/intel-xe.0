Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D63B4C79F99
	for <intel-xe@archiver.kernel.org>; Mon,  7 Sep 2026 19:25:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BC5710E081;
	Mon,  7 Sep 2026 19:25:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="leY9iIsv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64B7B10E081
 for <intel-xe@lists.freedesktop.org>; Mon,  7 Sep 2026 19:25:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788809109; x=1820345109;
 h=message-id:date:subject:from:to:cc:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Fhvv4MSWxqP5Cxh/ta9ygCC30BekUSBheP+mq5y1fEs=;
 b=leY9iIsvvXVtEbbARURZ+5dCDKUlu5kJKPoRJGOE581D0eDCeU0U1QcE
 PM+rU1MFYuMDZ6feTfHOI6DcJIT3J/MWscjUdiJmfCnOdNMhzgPVeqrd2
 rN8bZrV3O7+UpJGAY9xknDGhcRBT98ROcd/33mqTn+ziO0M/+pVYHCPAL
 dwdMiLQJG+zDC172qOtscABr6vsgc5nxSX8aeowz5T4+lncCE8v+2KByK
 UnscbOh6Ddcv05wwo54u6dUQ1/3fZ4bnWO0nNo8TayGOksCfl6N/xL57C
 uYLdMJ9AgG8tKqsfoogQY3pntQPYgyw/re9+3tywtvF1B2PYTWoCMxeHW w==;
X-CSE-ConnectionGUID: sFARwP3URryCzXazePbglg==
X-CSE-MsgGUID: JmqeSKWAT7Srsn5XUy66Nw==
X-IronPort-AV: E=McAfee;i="6800,10657,11899"; a="93076738"
X-IronPort-AV: E=Sophos;i="6.25,267,1779174000"; d="scan'208";a="93076738"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2026 12:25:09 -0700
X-CSE-ConnectionGUID: IYcfUfaWTKWvAZezsiuwtg==
X-CSE-MsgGUID: XBksT6vEQt630h7pafrkJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,267,1779174000"; d="scan'208";a="269468702"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2026 12:25:09 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 7 Sep 2026 12:25:08 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Mon, 7 Sep 2026 12:25:08 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.65) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 7 Sep 2026 12:25:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VjahYsjo0iaJ2fEYXFa2ayMfJiWJ1h5437kp4JwRwpOGY2AQ2nHaCfc8YYv0yLT5Bivh3Cj+QEH8BI6hto0URROlXa6jIsO8J80A1rlLZ2YtOvLTGTvSfNldAgTGLUItJu3Ib8dqS8aZQYDpCMZfZGmLQsidIgPFcc2ufR7GGDu4PfYw6rFPPNVoaGueNZBXuKA7Y67mJyU2fsDG1Trjey2bqS+Y82Mbyj5e/J8KUcGSbTBwu2DmbG4NWCm8tPA37s5F2XNk3qHFtj4xf/ONEhH6QRw0Uy8BnYHK+wb2Gdb7Mn4rAS1MDrjk8aOZXmVkDh6aU0sShGCVxw+MuVwzFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AX48EYQFbSgAOZdV/v1cusYlPknQX3NvAEm73/YgI04=;
 b=lTHojRHllk2UBxDZSIhVoPuLqoOh0QbVsF/aBugtoAnJ9wqWZvwPdq2exYVPDF4oK++I8SXYF5a/1mggXR67UOuCqLzPw1/fZsXGfzJbUfPT7BcTz/xMAALkt/K4ntMh7bm+C+DhkmNYiBB65z06duJCij/qv51PeSOeTLt7rRoPJnxXrlQmv7MJIRwbGv4d+yDReTNpHQzG/oEYs5gBHcH1IG9/i1Qldn5HMru4LbD6vQ04a/F+wXKQebDJIolwvGZu85CBHj69FgivDTnYiDXV5Zu5MLY3XQyNWyd9RA+OGiIr65PWv916MUSVnHjk0EC1U9pl5NkqwpENMgeTHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a) by DM4PR11MB6454.namprd11.prod.outlook.com
 (2603:10b6:8:b8::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.15; Mon, 7 Sep
 2026 19:25:06 +0000
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::5a5c:9c7a:cd1d:d687]) by DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::5a5c:9c7a:cd1d:d687%6]) with mapi id 15.21.0382.014; Mon, 7 Sep 2026
 19:25:06 +0000
Message-ID: <6022bd05-ffc7-4c79-be42-265f8ab50235@intel.com>
Date: Tue, 8 Sep 2026 00:54:49 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/6] drm/xe/xe_ras: Add function to get maximum pages
 firmware can store
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
To: Riana Tauro <riana.tauro@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <rodrigo.vivi@intel.com>,
 <aravind.iddamsetty@linux.intel.com>, <badal.nilawar@intel.com>,
 <raag.jadav@intel.com>, <ravi.kishore.koppuravuri@intel.com>,
 <mallesh.koujalagi@intel.com>, <soham.purkait@intel.com>,
 <tejas.upadhyay@intel.com>
References: <20260907094706.1407436-8-riana.tauro@intel.com>
 <20260907094706.1407436-12-riana.tauro@intel.com>
 <3cd8b5ff-40e2-414d-8b41-5ca524d70775@intel.com>
Content-Language: en-US
In-Reply-To: <3cd8b5ff-40e2-414d-8b41-5ca524d70775@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0311.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:21a::6) To DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPF691668CDD:EE_|DM4PR11MB6454:EE_
X-MS-Office365-Filtering-Correlation-Id: e6fe89b6-c604-402c-5b2d-08df0d15b930
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|1800799024|366016|10067099003|4143699003|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: NmpUM0aVG0uUDlh+w+N+ZDxsc3KEkuHsshz+cvYb9kpMptQTNGdLVF6qRxB7FyktQxBS7x/eGWsBjUzh0j6pk2uH8uQdPay4gzOIzjjXsa0zdCI5XP8EhgQY0jA22yL6hVpdwW/wMcjGz18oOy+cScLgq3hSMnHzmxg9TbKi+SnmU2PogO8/Q8uV3os0RPoIIUtQ8NE1hfHQ0i5dN5nFVqKJtlxTWfsDfHXoIh4EB3G6ZTDrvO6F3+OlHBlngwfbXtX0vd1Lp8qOc8wdqAfWXjklaTkqDyUrN6h8zATxHoEcexrikWxk5GnGtffdcXQO5nGmJmHCV/1O96Av1HRMoa+FvRHsjyzegn9MFrVt6NtNxfN7+OYlcbUtYh2YUVcvRe4W41f19lN/UUVvmOYX4+Ruif2ol4twfM/1S6idabD7ySnFuoUTyw7x2ID4/ivioNxdXYf9qjmL0RCbZ7jLaBAbTM8V5nFPz8+mtAQ2O5KgDdpMIowOGm3gaONqXhhqQrf5qg/iFIFMQCxZa7YW5fbJgpiZpMB6NLa95phnKeeVpXzGYGJZrp3L3qCXw+kjeIIgqROUZHUctOj2BiUND0N07orJzKSw8sFnP1aJFcXerukXNt2sqIF4Y4sZGvsgCvNXbWHn3QMRZLnCNrj19clwfBnWcCw2H0wuzLgQ2BE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPF691668CDD.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(10067099003)(4143699003)(11063799006)(56012099006)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dkljTmcvVkNzQ1pQU0hxdEhWNXZLR1VMSUY5V3JLdEV0ampSdndVaHhDYmJL?=
 =?utf-8?B?bVNzMlp0eVUydzVqMG1uQi9RNEM5cWNFT2g0MGQya3RmR3hmOXNyaTd2ZjA2?=
 =?utf-8?B?NlRYT3NtYXR5QTh1NVhQZmUzNW1SNDVYN3dlQXBndzQ1TXE2SzhEVmdYdXly?=
 =?utf-8?B?Q0x4cU9iRlBydGd3MnVabVJSRm41U3BOQ2w4bnNzRi9sWDhzSnV6amFnMGhV?=
 =?utf-8?B?R0FTTGxVaWw2cmd4MDVubmZkU3hocW5ZWXdhZHdNY0JpY052UmgrUHQ1ZnEx?=
 =?utf-8?B?RUN1TFgxWDE5VVZKYXMwbkFBWE5aaUFTbUc2NUZjNEx5U1UvenJwMnlUQVps?=
 =?utf-8?B?c2RKWVJsSEVNVWtqYWlIL2FHdVFVdzF1NEpyQkYzczFpNVIzMkljN2xEemZk?=
 =?utf-8?B?dFluZ2xWek9maHZZS0pGYTc4ZjFNRjNzWm80cHl6c1lvaEhwbmtsUTJOQm5n?=
 =?utf-8?B?eTVlYkZGa3pZYWlWMUdZRmU0MnBVTUdEM2hicTVhS2cyZFFHZW5CNmJjeFVh?=
 =?utf-8?B?R1ZPTjl3cmFtZGMxYUNoSnVRMjJEdEoxa1ZaUVVmcytOd2J0Q0V1bmhIMmxS?=
 =?utf-8?B?N0FpRlBDV1QrSi9HUkxFZFl5MWE5am9GbkZjMnh5SDBrclhSQkR6bGZ3QXFL?=
 =?utf-8?B?NkgxWjFnSzA0OGJKQ3FZK2g1RVlNSGhWNW5IZlN6YVZyQys2eWovQWR1d3lv?=
 =?utf-8?B?bWo3Y2JnaEprY3BJOFc2Y2k4ay9wZmpUV21hNFlMeitIcHRteU1kaWhteVVK?=
 =?utf-8?B?QlhiV2swQ0UvcE1GMGl1dlJabDBkODl1b21vVXFldnNvbENJOExKT0pDVjFm?=
 =?utf-8?B?RkRNMTlsbXdnVXZucGc1MVA3V1N2dlA4MzRuZnA4MjQwdWtORHh4Z1JySFhy?=
 =?utf-8?B?UTVpd1BqWUh6ZmZoUVg0Y0ZLcHpsNE9CU2h0VzVrKzRqSXJLQ2tuV1NPbUJr?=
 =?utf-8?B?Snh0b1oyVHhxbGdBa3N4ZmdhbEZoQVhKc1hOUVNzMTRORVZob2x4Z3JvN0pr?=
 =?utf-8?B?VHFZUUlqam9lelk3enFDdFE0R2pRYlpKSW01Y1pTSVFDK1Q4UGNlOUdwYS9z?=
 =?utf-8?B?MXdlQlJUaWl4dkZXbTBEYWptTDUrZXoxejQ1blBnVmhBZkNQNnNvMjZKcHBk?=
 =?utf-8?B?Y0ZxcG9PNWdhQWhTR3U1TXEyYU81aEp4dHJtajV2M2txUWlFYnRRZDdnRU1L?=
 =?utf-8?B?N0V6WFgzSVJqNng0WWtIbExHeUtReENFbWZ1NjQxR3hTenpTMzB3M09GOE5E?=
 =?utf-8?B?QnJDT1ozYkQ2K3JIMHpzdVRHZHUwcSszQm9Cd0QwTGQvYnV5NDJIdTd0TjBD?=
 =?utf-8?B?R0hTa09hZjVHb2pSSEZMa1RDSGtXbnRQRi9kQU1ock80Wlo4MkNSRnRJV2Fs?=
 =?utf-8?B?c2tIK0xia2lHTDJHcTdHRHArUzl2azhaK3ROSHdsQnE3N2g4ZDVDamVNNDN6?=
 =?utf-8?B?VFNIWm1ZKzdkMk5vckV0MkhKTnNkSi9KU1ZYYjMzclM0WkFQUWtNYUJtVEtp?=
 =?utf-8?B?TGJvbGcvTWJWUUdjV0RpUVA2YXg1Z0JYRzdnZUhkbkl3TktzTzE3NUxiZlRO?=
 =?utf-8?B?cU5NdFYrTmJuakVrNUpLYUQ1Umh3RE40UXZzZUpkVGtNU3djMGtIdGM3cEpC?=
 =?utf-8?B?bFIveEdOZ2FGWWtycDlDYlJna0dId2hrZi9CWTlzT1llOGVCRjlobHI2bUtC?=
 =?utf-8?B?dGszaVIrR1U4T3k1VjkzSzA5Nm1ML2RXZ0lFV1VPOTViUUdRRTdIc1ptTUpB?=
 =?utf-8?B?Y1VXQnRGVURDczJzU2F3ODQ5M1NSdTRIazMzTmJBazM2OGJmVGlGTktScWNQ?=
 =?utf-8?B?aGJnc0cxMTNaNnFHT3E2RTQwNUkvVFFKS2NNcGp6c2NqRzJySWhTMTZZK1Jk?=
 =?utf-8?B?R0RyMHVaOVpKTjhtZWNlUFZuaFluMmFiNHF3RlJwYWhyRE5XWUN2dldVWGR2?=
 =?utf-8?B?MVdtWEJCMlMrbkpjZ2VuMUVQZ1hqS3JIcjZnODFYbkpaUytoQmM4SW9GYnlN?=
 =?utf-8?B?eUVFREpzR1IvemkyZ2ViQ3F1M0RpWDJBWVVIMi93dnFrbFErVFpXWUJQRVQz?=
 =?utf-8?B?RVRUZHFNOU1CY0NsVVRzS0grRkdGZVExeSsremJ5c2NMUUcxbHVYYVFYNTRD?=
 =?utf-8?B?VnFsVFdhR3J0cTJTMUFaZE5FRXBZOGNOdlFqQ2E2UEs4dXExQ01KbGg2UlRR?=
 =?utf-8?B?TEJOMHNPM0swNE9JVncwTFhjU0lsWURpck5jWXkwWndrUXBSc1BxT2pWQnl6?=
 =?utf-8?B?U1gvZTF2UnBJcXcxNHFBdml2QXZMRSsxeWt6ZXRQMmdWdlR0MUdMSGlFRGNH?=
 =?utf-8?B?dEZWUjF2YUk5aklucU5sS2JVVGZkWENTOVRDd2hpOHJ0alR4UXU4TmZLbWRh?=
 =?utf-8?Q?qYRJcIQ42jgv4nI0=3D?=
X-Exchange-RoutingPolicyChecked: hopxGnG1tlR5h5IzmWlIYabEofp9lIVsYlXsjvJxMw5xBvWBZ7aWnGhlobFtXUM9gpJZUkfN9daEkr89I/eyqg2iK5lvdRybVWaXAdPEhrE4IoB5OlZkBeqCkhJWszxlYvv7oOggwnjR9I/I0fUkTe98SnLjjHdfwvHvyF8thY+GQlZcFtTNPyriknXN+fIbQPx5doxNX+3ldzC1++y/YOFcNneDIlECEh/RzXXI79aaU8JTd5ZnkXWHO+zja0f/yyU6qHzpQdoU2sGDDiDsJ0HM01iq3cc7fE5VnE4u59j2/qWqS3txe1yr/5gq6BZOLTBuqSN5oVlgTdkSvgLgeg==
X-MS-Exchange-CrossTenant-Network-Message-Id: e6fe89b6-c604-402c-5b2d-08df0d15b930
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF691668CDD.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2026 19:25:06.3705 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 69LiW/DJmJdpVWqpu9Qk0L46kj9pXftkT2eJYSXr9epxeFXyEi1Urm1qMOq/prkZIpNmsJJyYPHbLBykPzjJ3kXAiJciz157FNW+KURgHsE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6454
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



On 08-09-2026 00:51, Ghimiray, Himal Prasad wrote:
> 
> 
> On 07-09-2026 15:17, Riana Tauro wrote:
>> Add function to get maximum number of pages that firmware can store for
>> offline tracking. This will be used in sysfs while reporting bad pages.

currently reporting in debugfs, and we might move to netlink, rectify 
commit message.

With this Nit addressed. RB holds.

>>
>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_ras.c       | 4 ++++
>>   drivers/gpu/drm/xe/xe_ras.h       | 5 +++++
>>   drivers/gpu/drm/xe/xe_ras_types.h | 2 ++
>>   3 files changed, 11 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
>> index b5b0c1a3a663..7058482e32a9 100644
>> --- a/drivers/gpu/drm/xe/xe_ras.c
>> +++ b/drivers/gpu/drm/xe/xe_ras.c
>> @@ -381,6 +381,7 @@ static void get_offlined_list(struct xe_device *xe)
>>       struct xe_sysctrl_mailbox_command command = {0};
>>       struct xe_ras_offline_list_response response = {0};
>>       struct xe_ras_offline_list_request request = {0};
>> +    struct xe_ras_state *state = &xe->ras.state;
>>       u32 count = 0, total_pages = 0;
>>       size_t rlen;
>>       int ret, i;
>> @@ -412,6 +413,9 @@ static void get_offlined_list(struct xe_device *xe)
>>           for (i = 0; i < response.pages_returned && i < 
>> XE_RAS_NUM_PAGES; i++)
>>               handle_page_offline(xe, response.page_addresses[i], false);
>> +        if (!state->max_pages)
>> +            state->max_pages = response.max_entries;
>> +
>>           count += response.pages_returned;
>>           if (!response.pages_returned)
>>               break;
>> diff --git a/drivers/gpu/drm/xe/xe_ras.h b/drivers/gpu/drm/xe/xe_ras.h
>> index 6e65443cd262..c411a6cb3731 100644
>> --- a/drivers/gpu/drm/xe/xe_ras.h
>> +++ b/drivers/gpu/drm/xe/xe_ras.h
>> @@ -27,4 +27,9 @@ static inline bool 
>> xe_ras_get_disable_page_offline(struct xe_device *xe)
>>       return xe->ras.state.disable_page_offline;
>>   }
>> +static inline u32 xe_ras_get_max_pages(struct xe_device *xe)
>> +{
>> +    return xe->ras.state.max_pages;
>> +}
>> +
>>   #endif
>> diff --git a/drivers/gpu/drm/xe/xe_ras_types.h b/drivers/gpu/drm/xe/ 
>> xe_ras_types.h
>> index ca459e785add..9f23970fd5a1 100644
>> --- a/drivers/gpu/drm/xe/xe_ras_types.h
>> +++ b/drivers/gpu/drm/xe/xe_ras_types.h
>> @@ -423,5 +423,7 @@ struct xe_ras_set_health_response {
>>   struct xe_ras_state {
>>       /** @disable_page_offline: cached configfs policy, immutable 
>> after init */
>>       bool disable_page_offline;
>> +    /** @max_pages: Total number of pages that can be stored by 
>> firmware */
>> +    u32 max_pages;
> 
> LGTM
> Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> 
>>   };
>>   #endif
> 

